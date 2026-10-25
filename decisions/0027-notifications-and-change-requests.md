# 0027. Change notifications as links, and changes made by request

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** JSON-LD binding (Transport mechanics); semantic model (Changes, Origins, Versions, Identity); decisions 0009, 0010, 0019, 0020 and 0021; requirements NCF-SEM-031, NCF-BND-JSONLD-003, NCF-BND-JSONLD-004 and NCF-BND-JSONLD-005

## Context

The JSON-LD binding lists ways to receive changes, but did not say what a change notification carries, and let a participant publish a Thing to a server with a mutating method.
The whale-sightings prototype (github.com/NMEA-Cloud/whale-sightings) sends the same message over server-sent events, WebSocket and MQTT: the kind of event, created, updated or deleted, and a link to the sighting, built from the subscriber's own address; a receiver fetches the sighting and identifies it by its `@id`, and after missing messages fetches again.
Decision 0019 then made the origin the only applier of changes.

## Decision

- A change notification carries the kind of change and a link to the Thing (NCF-BND-JSONLD-003), and may carry hints: the new version's IRI, the Thing's type, when it was modified, and its area as a bounding box.
  A receiver holding the named version need not fetch; it acts on the Thing it fetches, not on the hints.
- A receiver acts on a delete without retrieving the Thing only when it trusts the channel (NCF-BND-JSONLD-004).
- The link is a locator, possibly made for the receiver; the receiver identifies the Thing by the IRI its representation gives itself.
- A receiver that may have missed notifications fetches again with conditional requests; a resume point, such as an SSE event `id` or an MQTT persistent session, is optional.
- CoAP Observe differs: its notification is the representation itself.
- Any participant can request a change with `POST`, `PUT`, `PATCH` or `DELETE`, but a request is not a change: the origin decides under the owner's authorization policy, the owner makes the change and may sign it, and the requester appears in its provenance (NCF-BND-JSONLD-005).
- Who owns a Thing created on request in another's collection depends on the collection owner's contribution policy: ownership passes to the collection's owner, as with a work made for hire, or the contributor keeps it and licenses the Thing to the collection's owner; the Thing states its owner and terms.

## Consequences

Applied in the JSON-LD binding (Change notifications and Requesting changes under Transport mechanics, and the HTTP and CoAP sections, where Publishing becomes Requesting changes), and the glossary (Change notification).

Still open: how a notification is encoded; how a collection's owner publishes its contribution policy; where a contributor keeps ownership, which origin applies later changes.
