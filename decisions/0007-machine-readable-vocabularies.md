# 0007. Publish vocabularies as machine-readable files

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Part II (Vocabularies); decisions 0003, 0005 and 0006

## Context

The vocabularies define the terms that implementations put into data, devices and data catalogs.
If they exist only as prose, every implementer has to transcribe them by hand, and transcriptions drift from the source and from each other.
Software needs a form it can load directly, for example to expand compact JSON-LD (decision 0003) or to validate data against the terms.

Decision 0005 already proposes machine-readable files as the source of truth for each vocabulary module, with the chapters generated from them.
This record makes publishing those files a decision in its own right.

## Options considered

1. **Prose only.** Simplest to write, but every implementer transcribes the terms by hand, and errors and drift go undetected.
2. **Machine-readable files published alongside hand-written prose.** Software can use the terms, but the two copies can disagree, and nothing says which one wins.
3. **Machine-readable files as the source of truth, with the prose generated from them.** One copy of each term, and CI can check examples against it; but it needs tooling, and contributors edit data files rather than prose.

## Decision

Vocabularies defined by this document are published as machine-readable files, maintained in this repository under `vocab/` and dedicated to the public domain under CC0 (decision 0005).

Still to decide:

- the formats, for example JSON-LD contexts and shape definitions for validation;
- whether the files are the source of truth with the chapters generated from them (option 3, as proposed in decision 0005), or are maintained alongside the prose (option 2);
- where the files are published and how their identifiers resolve, which depends on namespaces (decision 0006).

## Consequences

Implementations can load the terms directly rather than transcribing them.
Each vocabulary module needs its files as well as its chapter, so adding or changing a term means changing both, or the tooling that generates one from the other.
CI can validate the files and the examples in the document against them.
