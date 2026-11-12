# 0021. IRIs as opaque identifiers

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Identity, Namespaces, Origins); Trust and security (Data owners); decisions 0006, 0014 and 0020; requirements NCF-SEM-001, NCF-SEM-004 and NCF-SEM-033

## Context

The framework identifies every Thing by an IRI, and divides identifiers among naming authorities by the IRI's authority component.
Owners will allocate IRIs with structure of their own, such as `/notices/` or `/versions/7`, and a receiver could be tempted to read a Thing's kind, owner or version from that structure.
Decision 0020 also lets an owner reach a version through a short IRI, so the address a Thing is reached by need not be its identifier.

## Decision

- An IRI is an opaque identifier, following the Web Architecture's practice of URI opacity.
- What a Thing is, who owns it, and which version a representation carries are stated in the representation, not read from the IRI (NCF-SEM-004).
- A Thing's owner is not the holder of its IRI's domain; the owner is stated in the Thing and proved by its signature, as decision 0014 separates data owners from servers.
- An IRI's authority keeps two roles that are not meanings of the Thing: locating the server, as the IRI's scheme defines, and dividing identifiers among naming authorities.

## Consequences

Applied in the semantic model (Identity).
A receiver attributes a change to a Thing's owner (NCF-SEM-033) by what the Thing states and its signature, not by the domain it came from.
An owner is free to change how it structures new IRIs.
