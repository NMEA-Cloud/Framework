# 0002. Author as a living document in Quarto

- **Status:** Accepted
- **Date:** 2026-10-13

## Context

The framework is a living document, like the WHATWG HTML Living Standard, rather than a formal standard with numbered editions.
It must be easy for many human and AI contributors to change, review and publish as HTML.
Some readers will still need a fixed version to cite.

## Options considered

1. **Word processor or Google Docs** — familiar, but changes are hard to review, AI agents cannot work on it like code, and there is no clean HTML output.
2. **LaTeX** — good PDF, but awkward HTML and a barrier for many contributors.
3. **Markdown with Material for MkDocs** — popular, but entering end of life in November 2026.
4. **Markdown with Zensical** — successor to Material for MkDocs; HTML only.
5. **Markdown with Quarto** — HTML website and PDF from one source; numbered sections, cross-references and citations built in.

## Decision

Author in Quarto Markdown in Git, publish the website from `main` on every merge,
and publish a dated PDF snapshot (via Typst) only when a release is tagged.
Every snapshot is marked on every page as a snapshot, with a link to the current version.

## Consequences

The website is the single source of truth. Changes are reviewed as pull requests.
PDFs exist for citation but cannot be mistaken for the current version.
Contributors need Quarto installed to preview locally; CI builds every pull request for those who do not.
