# 0005. Vocabulary licensing and management

- **Status:** Provisional
- **Date:** 2026-10-13
- **Related:** Part II (Vocabularies); semantic model chapter; decisions 0006 and 0007

## Context

The framework will contain many schema and semantic definitions.
They are meant to be copied into every implementation, data catalog and device, by governments, companies and individuals.
They will evolve continuously, and other communities will want to extend them.

## Options considered

1. **Same license as the text (CC BY 4.0).** Attribution requirements create friction when terms are embedded everywhere.
2. **Apache 2.0.** Well understood, with a patent grant; but NOTICE requirements are awkward for definitions embedded in data and firmware.
3. **CC0 (public domain).** No conditions at all. No patent grant, but patent risk in a vocabulary is negligible.

The NMEA data dictionary is distributed under NMEA's standards license, not openly, so its definitions cannot be copied into an open vocabulary.
Options for vessel and instrument data:

- **A. NMEA releases the data dictionary terms openly.**
- **B. The framework defines its own open terms,** and the sentence and PGN bindings map them to the data dictionary by identifier only.
- **C. An existing open vocabulary for vessel data is adopted.**

## Decision

- **License:** everything under `vocab/` is dedicated to the public domain under CC0 1.0.
  The vocabulary license does not apply to data that uses the vocabulary; publishers state their own terms (requirement NCF-SEM-020).
- **Reuse:** third-party vocabularies (schema.org, Darwin Core …) are referenced by IRI, not copied.
  Definitions from licensed standards, including the NMEA data dictionary, are never copied.
- **Source of truth:** each module is maintained as machine-readable files (terms, plus shapes for validation),
  with the human-readable chapters generated from them (see decision 0007). *(To be set up.)*
- **Lifecycle:** terms are never deleted or redefined, only deprecated. Breaking changes need a new term.
  Each term has a status: proposed, stable, deprecated.
- **Extension:** anyone may define terms in their own namespace without permission.
  This repository governs only the core modules; widely used extensions may be proposed for inclusion.
- **NMEA data dictionary:** stays under NMEA's standards license and is not part of the open vocabularies.
  Users of the sentence and PGN bindings license its definitions from NMEA.
  Still open: whether vessel and instrument data use the framework's own open terms (option B) or an existing open vocabulary (option C).
- **Checks:** CI validates examples against the shapes and fails if a stable term is removed or changed. *(To be set up.)*

## Consequences

Anyone can use the vocabularies with no legal review beyond recognizing CC0.
The NMEA data dictionary cannot simply be absorbed: implementers of the sentence and PGN bindings need a license from NMEA,
and the source of open terms for vessel and instrument data is still to be decided.
Namespaces must be decided before any term is marked stable (decision 0006).
