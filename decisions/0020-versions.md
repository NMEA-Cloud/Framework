# 0020. Versions identified by IRIs of their own

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Changes, Versions); decision 0019; requirements NCF-SEM-002, NCF-SEM-012, NCF-SEM-030, NCF-SEM-032, NCF-SEM-040, NCF-SEM-041, NCF-SEM-042 and NCF-SEM-043

## Context

Decision 0019 gives a Thing a new version with each create and update, and ties a scheduled change to the version it was scheduled against.
It left open how a receiver that applies a scheduled change while out of contact identifies the version that results.
The semantic model also needs to say how a receiver tells which version it holds and whether it is the latest, including when it holds copies received by different routes.

## Options considered

1. An opaque identifier assigned by the owner: cheap, and possible on any device, but a receiver cannot compute it.
2. A hash of the Thing's content: anyone can compute it, but it needs a canonical form, which is costly on small devices and impossible from what AIS carries.
3. A hash of the change and the previous version, chained as Git commits are: computable by a receiver that holds the chain.

## Decision

- A Thing has one owner, the resource's owner in REST terms, and only its origin changes it, so its versions usually form a single line.
- A split origin, whether between a vessel and its shadow, among servers on board, or among servers ashore, may branch a Thing's versions while its servers cannot reach one another, and then merges the branches (NCF-SEM-032).
  Whether it accepts changes at one server at a time and never branches, or anywhere and merges, is an implementation detail.
- Option 1: each version is identified by an IRI that the Thing's owner assigns, distinct from the Thing's own IRI and otherwise opaque (NCF-SEM-040).
  An owner may still form it from a hash, as options 2 and 3 do.
- Each version but the first names the version or versions it succeeds (NCF-SEM-041), a merge naming the latest version of each branch it merges.
  A version is newer than another if it descends from it; versions on different branches are concurrent; when a version was made is a hint.
- A merge is a change, so it cancels changes scheduled against the versions it merges unless it restates them.
- A scheduled change names the version it produces (NCF-SEM-042), so that a receiver applying it out of contact holds the owner's version under the owner's IRI.
- The version's IRI is part of the representation, the same on every transport; validators such as HTTP entity tags are the server's choice, and can be derived from it.
- The owner may keep earlier versions at their IRIs, linked with the RFC 5829 version relations; a version's IRI identifies it whether or not it is kept.
- A reference to a Thing refers to its current version; a reference that needs the Thing as it stood names the version's IRI.
- A version's IRI can be written relative to the document's base, or the owner can give a short IRI from a URL shortener.
  A short IRI is only a locator; the version is identified by the IRI its representation gives itself.
  Since a JSON-LD document's base defaults to where it was finally retrieved from, after redirects other than 303 See Other, a version's representation gives its own IRI in full or sets its base (NCF-SEM-043).

## Consequences

Applied in the semantic model (Versions, with Earlier versions and Short identifiers), and the glossary (Version).
This resolves decision 0019's question of how a receiver identifies the version a scheduled change produces, and the question, raised with decision 0019's origins, of whether a split origin may accept changes on both sides of a partition.
A publisher must assign and keep track of version IRIs, and a receiver cannot check a version's identifier against the content.

Still open: what a receiver holding two concurrent versions does until a merge reaches it; which terms state a representation's version and the version it succeeds.
