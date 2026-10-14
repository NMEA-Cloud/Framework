# Guidance for contributors and AI agents

This file tells anyone working on this repository — human or AI — how the project is organized and the rules for changing it.
AI coding agents read it automatically; humans should read it too. `CONTRIBUTING.md` covers the human workflow.

## What this repository is

The source of the **NMEA Cloud Framework**: a living framework document (not a formal standard) describing how vessels,
their shore-side shadows and shore services share information with one consistent meaning across transports.
It is written in Quarto Markdown and published as a website, with occasional PDF snapshots.

## Layout

| Path | Contents |
|---|---|
| `index.qmd` | About this document: status and conventions |
| `overview/` | Part I — introduction, architecture, semantic model, trust and security |
| `vocab/` | Part II — vocabulary modules (one file per domain) |
| `bindings/` | Part III — one file per transport; `_template.qmd` is the template for new bindings |
| `applications/` | Part IV — informative worked applications |
| `appendices/` | Glossary and references |
| `references.bib` | Bibliography (BibTeX) |
| `decisions/` | Decision records (not part of the published document) |
| `_quarto.yml` | Book configuration, including the chapter list |

## Build and preview

```sh
quarto preview                # live preview in a browser
quarto render --to html       # full HTML build into _book/
```

A change is not ready for review until `quarto render --to html` succeeds without warnings.

## Writing conventions

- **One sentence per line** (semantic line breaks). Do not reflow paragraphs; it makes diffs unreadable.
- **American English** spelling, following NMEA practice.
- Start every chapter with `[Normative]{.status}` or `[Informative]{.status}`.
- **BCP 14 keywords** (MUST, SHOULD, MAY …) appear in capitals only in normative requirements, never casually.
- **Requirements** use this block, and nothing else may contain BCP 14 keywords:

  ```markdown
  ::: {.requirement #ncf-sem-014}
  **NCF-SEM-014** · *Draft*\
  Requirement text.
  :::
  ```

  IDs are `NCF-<AREA>-<NNN>`: `SEM` semantic model, `TRU` trust and security, `VOC-<MODULE>` vocabularies,
  `BND-<BINDING>` bindings (`JSONLD`, `AIS`, `SEN` sentences, `PGN`). The anchor is the lowercase ID.
  **Never renumber or reuse an ID.** To remove a requirement, change its status to *Withdrawn* and leave it in place.
  Statuses: *Draft*, *Agreed*, *Withdrawn*.
- **Terminology:** use terms as defined in `appendices/glossary.qmd`. A new term is added to the glossary in the same change that introduces it.
- **Cross-references:** chapters and sections have IDs (`{#sec-…}`); refer to them with `@sec-…`. Link requirements with `[NCF-SEM-001](#ncf-sem-001)`.
- **Citations:** cite with `[@key]` from `references.bib`.
- **HTTP and HTTPS:** call the protocol HTTP, not HTTPS, even though it is normally carried over TLS.
  Every example URI or IRI uses a secure scheme: `https://` for HTTP, and the secure equivalent for other protocols where one exists (for example `wss://`, `mqtts://`).
  Real identifiers defined elsewhere keep their published form (for example Darwin Core's `http://rs.tdwg.org/dwc/terms/…` term IRIs).
- **Unresolved points** go in an `Open question` callout, and should have a matching GitHub issue. Unwritten sections use a `To be written` callout.
- **Diagrams** are Mermaid code blocks, so they are versioned and reviewable as text.

## Rules for AI agents

1. **Work on a branch and open a pull request.** Never commit to `main`.
2. **Do not invent facts about external standards.** Do not guess NMEA sentence or PGN numbers, AIS message or ASM identifiers,
   clause numbers or publication details. If you cannot verify something, write it as an open question.
3. **Never add a reference you have not verified exists.** Mark unsupported claims `[citation needed]` instead.
4. **Do not change the meaning of a requirement** unless the issue or person you are working for explicitly asks you to.
   Editorial fixes (typos, formatting) are fine; say so in the pull request.
5. **Do not delete open questions to make a section look finished.** Resolve them through a decision record, or leave them.
   When the person you are working for settles a key question, record it as a *Provisional* decision.
6. **Keep changes focused.** One topic per pull request; do not reformat text you are not otherwise changing.
7. **Say what you did** in the pull request description, including anything you were unsure about, and credit yourself with a `Co-authored-by:` trailer.
8. **Never add a `Signed-off-by:` line.** The human submitting the work signs off under the DCO (see `CONTRIBUTING.md`); leave that to them.
9. **Never copy text or definitions from licensed standards** (including NMEA 0183, NMEA 2000 and the NMEA data dictionary) into this repository.
   Refer to them by name and identifier. Everything here must be releasable under the licenses in `LICENSE`.

## Licensing

| Material | License |
|---|---|
| Prose (`.qmd`, `.md`) | CC BY 4.0 |
| Everything under `vocab/` | CC0 1.0 |
| Code, configuration, templates, examples | Apache 2.0 |

## Vocabularies

- Terms are **never deleted or redefined**. A term may be deprecated; a breaking change needs a new term.
- Each term has a status: *proposed*, *stable* or *deprecated*.
- Reuse existing open vocabularies (schema.org, Darwin Core …) by referring to their IRIs rather than redefining their terms.
- Namespaces are not yet decided (see `decisions/0006-namespaces.md`). Until they are, write example IRIs under `https://example.org/` and do not invent real-looking namespaces.

## Decisions

Significant design decisions are recorded in `decisions/` (see `decisions/README.md`).
When the document depends on a decision, link to its record. When you propose a new direction, write a decision record with status *Proposed*.
When a key decision is made and applied in the document before the working group has reviewed it, record it with status *Provisional* and add it to *Needs group review* in `decisions/README.md`.
A Provisional record can be short: context, decision, and where it is applied.
