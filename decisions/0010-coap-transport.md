# 0010. CoAP as an alternative transport of the JSON-LD binding

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** JSON-LD binding; requirement NCF-BND-JSONLD-001; decisions 0008 and 0009

## Context

Constrained devices and links need a lighter transport than HTTP, and on board there is a need to send changes to many receivers at once over IP multicast.

## Options considered

- **Raw UDP multicast with a `udp:` URI.** Not adopted: `udp:` is only provisionally registered, for the BitTorrent tracker protocol, so a new scheme and protocol would be needed.
- **CoAP group communication.** Uses the registered `coap:` scheme, with the multicast address as the host of a group URI.

## Decision

- CoAP is an alternative transport of the JSON-LD binding, alongside HTTP.
- `GET` retrieves a Thing; `POST` or `PUT` publishes one.
- Participants learn of changes by polling, Observe (RFC 7641), or group communication over IP multicast.
- Group communication follows `draft-ietf-core-groupcomm-bis`, which replaces the Experimental RFC 7390.
- `coaps:` uses DTLS; OSCORE (RFC 8613), and Group OSCORE once published, are candidates for protecting CoAP messages.
- NCF-BND-JSONLD-001 (HTTP/1.1 baseline) applies only to servers that offer HTTP.

## Consequences

Applied in the JSON-LD binding: the Overview, the CoAP transport section, Representation and Trust.
Multicast has no transport security, so a Thing sent to a group relies on its persistent signature unless Group OSCORE is used.
A signed JSON-LD Thing may not fit in one UDP datagram.
The group communication specification is still an Internet-Draft and may change before publication.
