# 0026. Usage terms as licenses, by version and by inheritance

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Rights and usage); Trust and security (Identity and authorization, Provenance); examples; decisions 0020, 0023 and 0025; requirements NCF-SEM-012, NCF-SEM-020, NCF-SEM-021, NCF-SEM-022 and NCF-TRU-005

## Context

NCF-SEM-020 lets a publisher state the terms that apply to any Thing, but left open which property states them, how they are inherited, and what happens over transports that cannot carry them.

## Options considered

For the property:

1. `dcterms:license` with the IRI of a license.
2. `dcterms:license`, whose value may also be an ODRL policy for terms of the owner's own.

For inheritance:

1. Every Thing states its own terms.
2. A Thing without terms takes those of the Thing it is part of, and failing that its owner's default terms.

## Decision

- Option 2 for the property: terms are stated with `dcterms:license`; where they are the owner's own, the license is an ODRL policy. `dcterms:rightsHolder` and `dcterms:rights` may be used alongside.
- Terms belong to a version, are signed with it, and can change between versions; a copy carries the terms of the version it holds, and whether a change affects copies already made is for the terms to say.
- Option 2 for inheritance (NCF-SEM-021); a receiver that finds no terms does not assume the Thing is free to use (NCF-SEM-022).
- A derived Thing names its inputs' versions, so its terms can be checked against theirs; compatibility is the deriver's responsibility.
- Over transports that cannot carry terms, they are lost and the copy is incomplete; a broadcast is not taken to be free to use.
- Usage terms (what a holder may do with a copy) are separate from access (who may read or change the Thing), which the origin's authorization policy sets.

## Consequences

Applied in the semantic model (Rights and usage), Trust and security (an identifier for Identity and authorization), the examples (the sighting's event carries a license its occurrences inherit), and the glossary (Usage terms).

Still open: which ODRL actions and constraints the framework needs, and whether it defines an ODRL profile; how an owner publishes default terms and a receiver finds them.
