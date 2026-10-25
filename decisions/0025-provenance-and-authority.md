# 0025. Provenance of Things and of copies, and authority by designation

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Trust and security (Provenance and authority); semantic model (Versions); Notices vocabulary; examples; decisions 0014, 0017, 0020, 0022, 0023 and 0024; requirements NCF-SEM-035, NCF-TRU-004, NCF-TRU-005 and NCF-TRU-006

## Context

The Trust chapter left provenance and authority to be written: who originated information, who relayed or transformed it, on whose authority, and how confidence is expressed.
Earlier decisions already gave receivers a provenance of their own copies (decision 0017), kept relays from signing (decision 0024), and let anyone issue a notice.

## Options considered

For authority:

1. A designation: a relationship Thing in which a party the receiver trusts names another as authoritative for a kind of information in an area.
2. Each receiver's configuration alone.

## Decision

- Provenance uses the W3C PROV Ontology, such as `prov:wasAttributedTo`, `prov:wasDerivedFrom` and `prov:actedOnBehalfOf`.
- A Thing's own provenance (who made it, from what, on whose behalf) is stated by its owner in the Thing and signed with it.
- A copy's provenance (transport, relays, time received, signature verification and tier, completeness, clock) is recorded by the participant holding the copy; it is not part of the Thing, though it may be published as a Thing of its own.
- The relays a Thing passed through belong to each copy's provenance; a relay that wraps a Thing makes a Thing of its own, derived from it.
- A derived Thing names each input by the IRI of the version it used (NCF-TRU-005).
- Option 1 for authority: authority is conferred by a designation, signed by the party that makes it; a receiver chooses the parties it trusts directly, and treats other sources as authoritative only through a chain of designations from them (NCF-TRU-006); other sources are contributors.
- Confidence in the content is the owner's to state, in vocabulary terms such as a position's uncertainty; confidence in the source is the receiver's judgement, part of the copy's provenance.

## Consequences

Applied in Trust and security (Provenance and authority, with Authority and Confidence), the semantic model (PROV-O's `prov:wasRevisionOf` as a candidate in an open question of Versions), the Notices vocabulary (Issuer as `prov:wasAttributedTo`, to be confirmed), the examples (the organism names the sighting's version it was derived from, with `prov:wasDerivedFrom` in place of `dcterms:source`), and the glossary (Designation, Provenance).

Still open: whether the designated party must also sign a designation; whether and how far designations chain; the terms in which a designation names a kind of information and an area.
