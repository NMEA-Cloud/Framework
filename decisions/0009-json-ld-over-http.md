# 0009. HTTP transport of the JSON-LD binding

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** JSON-LD binding; requirements NCF-BND-JSONLD-001 and NCF-BND-JSONLD-002; decisions 0003 and 0008

## Context

The JSON-LD binding needs to say how Things move over HTTP: which HTTP versions, which methods, how participants learn of changes, and how they find out which mechanisms a server offers.

## Options considered

- **`monitor-group` links** (RFC 5989) let a client follow several known resources in one subscription.
  Not adopted: the client chooses the group, so it cannot learn of new Things, and the list-subscription protocol is defined only for SIP.
  Following a collection Thing with a `monitor` link is the alternative (see the open question on collections in the semantic model).
- **MQTT topic in a separate property** next to a broker-only URI, as in the W3C Web of Things MQTT binding, instead of in the URI path.
  Left as an open question.

## Decision

- HTTP/1.1 is the baseline version; HTTP/2 and HTTP/3 are optional, and a client can discover them from the DNS HTTPS resource record (NCF-BND-JSONLD-001).
- `GET` retrieves a Thing; `POST`, `PUT` or `PATCH` publishes one.
- Participants learn of changes by polling, server-sent events, WebSocket, or an MQTT broker and topic.
- A Thing's JSON-LD links to each mechanism other than polling with the `monitor` link relation (NCF-BND-JSONLD-002).
  In JSON-LD the link is a property named by the IANA relation IRI; a framework vocabulary term is the fallback if that IRI is not stable.
- MQTT brokers are addressed by `mqtt:` and `mqtts:` URIs, extended so that the path gives the topic.
- The JSON-LD context is given by an `@context` property or, over HTTP, by a `Link` header.

## Consequences

Applied in the JSON-LD binding: the HTTP transport section, Representation and Requirements.
Open questions remain on the stability of the IANA relation IRI, and on how MQTT topics and wildcards are written in URIs.
