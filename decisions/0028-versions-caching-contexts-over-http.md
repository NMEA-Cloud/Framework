# 0028. Versions, caching, contexts and deletion in the JSON-LD binding

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** JSON-LD binding (Transport mechanics, Representation); semantic model (Changes, Versions); Trust and security (Authenticity); decisions 0019, 0020, 0022 and 0024; requirements NCF-BND-JSONLD-006 to NCF-BND-JSONLD-009 and NCF-VOC-NOT-001

## Context

Decisions 0019 to 0024 gave Things versions with IRIs of their own, scheduled changes that set how long a value holds, and persistent signatures over canonical RDF.
The JSON-LD binding did not yet say how these appear over HTTP.

## Decision

- A representation states the IRI of the version it carries; the entity tag is the server's own and can be derived from it, a strong entity tag differing between representations.
- A receiver revalidates with `If-None-Match`; a change request is conditional on its base version with `If-Match` (NCF-BND-JSONLD-006), refused with `412 Precondition Failed` if the Thing has changed.
- Responses link versions with `Link` headers and the RFC 5829 version relations; an earlier version that is kept is served at its own IRI.
- A server ends a representation's freshness lifetime no later than the Thing's next scheduled change (NCF-BND-JSONLD-007).
- A JSON-LD context used by a signed Thing never changes at its IRI; a changed context gets a new IRI (NCF-BND-JSONLD-008), and receivers can cache contexts indefinitely.
- An ended Thing, such as a withdrawn notice, is returned with `200 OK` and its status; a deleted Thing with `410 Gone` (NCF-BND-JSONLD-009).

## Consequences

Applied in the JSON-LD binding (Getting current state under HTTP, and Versions and caching and Contexts under Representation).
Publishers must version their contexts.

Still open: how a receiver checks that a context it retrieves is the one a signer used.
