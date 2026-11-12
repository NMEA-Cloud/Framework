# 0024. Persistent signatures as Data Integrity proofs over canonical RDF

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Trust and security (Authenticity); JSON-LD binding (Trust); decisions 0004, 0014, 0020 and 0023; requirements NCF-TRU-001 to NCF-TRU-004 and NCF-SEM-042

## Context

NCF-TRU-001 lets any Thing carry a persistent signature, and decision 0004 proposed JWS over the JSON-LD representation.
Since then, Things are fetched and held as cached representations of versions (decisions 0019 and 0020), a Thing may be carried as JSON-LD with any context or as CBOR-LD, and a contractual relationship needs the signatures of both parties (decision 0023).
A signature over one representation's bytes does not survive a cache or relay that re-serializes the Thing or converts it to another representation.

## Options considered

1. JWS over the representation's bytes: simple, but tied to one encoding; caches must keep the bytes, and the owner must sign each representation.
2. JWS over a canonical JSON form (JCS, RFC 8785): survives JSON re-serialization, but not a change of context or a conversion to CBOR.
3. A signature over the canonical RDF dataset (RDF Dataset Canonicalization), as W3C Data Integrity proofs are made: one signature verifies the Thing in every representation that maps to the same RDF, and Data Integrity supports several independent proofs as a proof set; canonicalization costs little when there are no blank nodes.

## Decision

- Option 3: a persistent signature is a Data Integrity proof over the canonical RDF dataset of one version of a Thing (NCF-TRU-002), with a cryptosuite such as `eddsa-rdfc-2022` or `ecdsa-rdfc-2019`.
- A signature covers one version, including the Thing's IRI, the version's IRI and its predecessors.
- A proof is not part of the version; adding one, such as a second party's to a contractual relationship, makes no new version, and several signers form a proof set.
- The owner can sign in advance the version a scheduled change produces, and the scheduled change carries that proof.
- A signed Thing should contain no blank nodes (NCF-TRU-003).
- A relay does not sign a Thing it relays (NCF-TRU-004); to add an assurance of its own it wraps the Thing in a Thing of its own, treated as derived from it.
- JWE remains the working proposal for encryption.

## Consequences

Applied in Trust and security (Authenticity, and an identifier for Provenance and authority), the JSON-LD binding (Trust), the semantic model (contractual relationships), the examples (AIS aliases as a JSON literal, so no example has blank nodes), and the glossary (Data Integrity, Persistent signature).
Decision 0004's signature bullet is replaced; its other proposals stand.
A signer and a verifier must canonicalize RDF, which needs the Thing's JSON-LD context; a Thing with blank nodes is costly to sign.

Still open: how a proof's verification method relates to a data owner's certificate (decision 0014); which cryptosuites a receiver must support, given constrained devices; how a scheduled change carries the proof of the version it produces.
