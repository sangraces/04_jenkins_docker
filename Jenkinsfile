pipeline {
  agent any

  triggers {
    pollSCM('H/2 * * * *')
  }

  options {
    timestamps()
  }

  environment {
    BUILD_TAG = "${env.BUILD_NUMBER}"
  }

  parameters {
    booleanParam(
      name: 'CLEAN_VOLUMES',
      defaultValue: true,
      description: 'Remove volumes (clears database)'
    )
    string(
      name: 'NEXT_PUBLIC_API_HOST',
      defaultValue: 'http://127.0.0.1:3001',
      description: 'Public API URL used by frontend (browser).'
    )
  }

  stages {

    stage('Checkout') {
      steps {
        script {
          echo "Checking out code..."
          checkout scm
          def shortCommit = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
          echo "Build: ${BUILD_TAG}, Commit: ${shortCommit}"
        }
      }
    }

    stage('Validate') {
      steps {
        sh 'docker compose config'
      }
    }

    stage('Prepare Environment') {
      steps {
        script {
          echo "Preparing .env for docker compose..."

          withCredentials([
            string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASS'),
            string(credentialsId: 'MYSQL_PASSWORD', variable: 'MYSQL_PASS')
          ]) {

            sh """
              cat > .env <<EOF
# MySQL
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASS}
MYSQL_DATABASE=dit312_6603105
MYSQL_USER=appuser
MYSQL_PASSWORD=${MYSQL_PASS}

# Ports
DB_PORT=3306
PHPMYADMIN_PORT=8888
API_PORT=3001
FRONTEND_PORT=3000

# Frontend public env
NEXT_PUBLIC_API_HOST=${params.NEXT_PUBLIC_API_HOST}

# API DB connection (IMPORTANT: host is service name in docker network)
DB_HOST=mysql
DB_NAME=dit312_6603105
DB_USER=appuser
DB_PASSWORD=${MYSQL_PASS}
EOF
            """
          }

          echo ".env created (not printed for security)."
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          echo "Deploying with Docker Compose..."

          def downCmd = 'docker compose down'
          if (params.CLEAN_VOLUMES) {
            echo "WARNING: Removing volumes (DB will be recreated + reseeded)"
            downCmd = 'docker compose down -v'
          }
          sh downCmd

          sh """
            docker compose build --no-cache
            docker compose up -d
          """
        }
      }
    }

 stage('Health Check') {
  steps {
    sh '''
      echo "=== docker compose ps ==="
      docker compose ps

      echo "=== Waiting for API /health (max 60s) ==="
      timeout 60 bash -c 'until curl -fsS http://api:3001/health >/dev/null; do sleep 2; done'

      echo "✅ API is healthy"
    '''
  }
}
    }

    stage('Verify Deployment') {
      steps {
        sh """
          echo "=== Container Status ==="
          docker compose ps

          echo ""
          echo "=== Deployed Services ==="
          echo "Frontend:   http://localhost:3000"
          echo "API:        http://localhost:3001"
          echo "phpMyAdmin: http://localhost:8888"
        """
      }
    }
  }

  post {
    success {
      echo "✅ CI/CD finished successfully!"
      echo "Frontend:   http://localhost:3000"
      echo "API:        http://localhost:3001"
      echo "phpMyAdmin: http://localhost:8888"
    }

    failure {
      echo "❌ CI/CD failed"
      sh 'docker compose logs --tail=80 || true'
      sh 'docker compose ps || true'
    }

    always {
      sh 'docker image prune -f || true'
      sh 'docker container prune -f || true'
    }
  }
}