"use client";

import { useEffect, useState } from "react";

export default function Page() {
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    async function getFoods() {
      try {
        const apiHost = process.env.NEXT_PUBLIC_API_HOST || "http://localhost:3001";
        const res = await fetch(`${apiHost}/foods`, { cache: "no-store" });
        if (!res.ok) throw new Error(`Failed to fetch (${res.status})`);
        const data = await res.json();
        setRows(data);
      } catch (err) {
        setError(err.message || "Failed to fetch");
      } finally {
        setLoading(false);
      }
    }

    getFoods();
  }, []);

  if (loading) {
    return (
      <main className="container">
        <div className="empty">Loading...</div>
      </main>
    );
  }

  if (error) {
    return (
      <main className="container">
        <div className="empty">Error: {error}</div>
      </main>
    );
  }

  return (
    <main className="container">
    <header className="header">
      <h1 className="title">Final Assignment — Rasita Srivilaived (6603105)</h1>
      <h1 className="title">Thai Foods Recommendation</h1>
      <p className="subtitle">
        Exploring the richness of Thai cuisine through a full-stack web application
      </p>
    </header>

      {!rows || rows.length === 0 ? (
        <div className="empty">No foods found.</div>
      ) : (
        <section className="grid" aria-live="polite">
          {rows.map((x) => (
            <article key={x.id} className="card" tabIndex={0}>
              {x.imageUrl && (
                <div className="media">
                  <img
                    src={x.imageUrl}
                    alt={x.name}
                    className="img"
                    loading="lazy"
                    decoding="async"
                  />
                </div>
              )}
              <div className="body">
                <h3 className="card-title">{x.name}</h3>
                {x.detail && <p className="detail">{x.detail}</p>}
              </div>
            </article>
          ))}
        </section>
      )}
    </main>
  );
}