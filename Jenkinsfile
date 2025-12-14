pipeline {
  agent any

  triggers {
    pollSCM('H/2 * * * *')
  }

  options {
    timestamps()
  }

  parameters {
    booleanParam(
      name: 'CLEAN_VOLUMES',
      defaultValue: true,
      description: 'Remove volumes (reset database)'
    )
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
        sh 'git rev-parse --short HEAD'
      }
    }

    stage('Validate') {
      steps {
        sh 'docker compose config'
      }
    }

    stage('Prepare .env') {
      steps {
        withCredentials([
          string(credentialsId: 'MYSQL_ROOT_PASSWORD', variable: 'MYSQL_ROOT_PASS'),
          string(credentialsId: 'MYSQL_PASSWORD', variable: 'MYSQL_PASS')
        ]) {
          sh """
cat > .env <<EOF
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASS}
MYSQL_DATABASE=dit312_6603105
MYSQL_USER=appuser
MYSQL_PASSWORD=${MYSQL_PASS}

DB_HOST=mysql
DB_PORT=3306

API_PORT=3001
FRONTEND_PORT=3000
PHPMYADMIN_PORT=8889
MYSQL_PORT=3307
EOF
"""
        }
      }
    }

    stage('Deploy') {
      steps {
        script {
          sh params.CLEAN_VOLUMES ? 'docker compose down -v' : 'docker compose down'
          sh 'docker compose build'
          sh 'docker compose up -d'
        }
      }
    }

    stage('Health Check') {
      steps {
        sh '''
sleep 15
curl -f http://localhost:3001/health
'''
      }
    }
  }

  post {
    success {
      echo '✅ CI/CD SUCCESS'
      echo 'Frontend:   http://localhost:3000'
      echo 'API:        http://localhost:3001'
      echo 'phpMyAdmin: http://localhost:8889'
    }
    failure {
      echo '❌ CI/CD FAILED'
      sh 'docker compose ps || true'
      sh 'docker compose logs --tail=50 || true'
    }
  }
}