import React, {useEffect, useMemo, useRef, useState} from 'react';
import Layout from '@theme/Layout';
import MarkdownIt from 'markdown-it';
import styles from './index.module.css';

const markdown = new MarkdownIt({html: false, linkify: true, typographer: true});
const defaultImageRenderer = markdown.renderer.rules.image;

markdown.renderer.rules.image = (tokens, index, options, environment, renderer) => {
  const sourceIndex = tokens[index].attrIndex('src');
  const source = tokens[index].attrs[sourceIndex][1];
  if (!source.startsWith('/') && !source.startsWith('#') && !/^[a-z]+:/i.test(source)) {
    tokens[index].attrs[sourceIndex][1] = `/api/asset?path=${encodeURIComponent(source)}`;
  }
  return defaultImageRenderer(tokens, index, options, environment, renderer);
};

function headingId(text, usedIds) {
  const base = text.trim().toLowerCase()
    .replace(/[^\p{L}\p{N}\s-]/gu, '').replace(/\s+/g, '-') || 'section';
  const count = usedIds.get(base) ?? 0;
  usedIds.set(base, count + 1);
  return count === 0 ? base : `${base}-${count}`;
}

export default function Home() {
  const articleRef = useRef(null);
  const [document, setDocument] = useState({name: 'Loading…', markdown: '', mtimeMs: 0});
  const [error, setError] = useState('');
  const [headings, setHeadings] = useState([]);

  useEffect(() => {
    let stopped = false;
    let knownVersion = '';
    async function refresh() {
      try {
        const response = await fetch('/api/document', {cache: 'no-store'});
        if (!response.ok) throw new Error(await response.text());
        const nextDocument = await response.json();
        const version = `${nextDocument.sourcePath}:${nextDocument.mtimeMs}`;
        if (!stopped && version !== knownVersion) {
          knownVersion = version;
          setDocument(nextDocument);
          setError('');
        }
      } catch (refreshError) {
        if (!stopped) setError(refreshError.message);
      }
    }
    refresh();
    const timer = window.setInterval(refresh, 750);
    return () => { stopped = true; window.clearInterval(timer); };
  }, []);

  const renderedMarkdown = useMemo(() => markdown.render(document.markdown), [document.markdown]);

  useEffect(() => {
    const usedIds = new Map();
    const nextHeadings = Array.from(articleRef.current?.querySelectorAll('h2, h3') ?? []).map((heading) => {
      const id = headingId(heading.textContent, usedIds);
      heading.id = id;
      return {id, text: heading.textContent, level: Number(heading.tagName.slice(1))};
    });
    setHeadings(nextHeadings);
  }, [renderedMarkdown]);

  return (
    <Layout title={document.name} description="Local Markdown preview">
      <main className={`container margin-vert--lg ${styles.previewContainer}`}>
        {error ? <div className="alert alert--danger">{error}</div> : null}
        <div className="row">
          <div className="col col--9">
            <article ref={articleRef} className="theme-doc-markdown markdown"
              dangerouslySetInnerHTML={{__html: renderedMarkdown}} />
          </div>
          <aside className={`col col--3 ${styles.tocColumn}`}>
            <nav className="table-of-contents table-of-contents__left-border">
              <ul className="table-of-contents__left-border">
                {headings.map((heading) => (
                  <li key={heading.id}>
                    <a className={`table-of-contents__link ${heading.level === 3 ? styles.nestedHeading : ''}`}
                      href={`#${heading.id}`}>{heading.text}</a>
                  </li>
                ))}
              </ul>
            </nav>
          </aside>
        </div>
      </main>
    </Layout>
  );
}
