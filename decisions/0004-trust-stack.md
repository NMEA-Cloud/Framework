# 0004. WebPKI, OpenID Connect, OAuth 2.0 and JOSE for trust

- **Status:** Proposed
- **Date:** 2026-10-13
- **Related:** Trust and security chapter

## Context

Receivers must be able to verify who originated information and that it has not been altered, wherever it traveled.
Publishers must be able to control who may read and write their information.
The NMEA plenary presentation (September 2026) proposed choices for this.

## Options considered

To be completed.

## Decision (proposed)

- Servers are identified by WebPKI certificates.
- Clients are identified with OpenID Connect.
- Authorization uses OAuth 2.0, under policies set by the resource owner.
- Data is signed with JWS and encrypted with JWE, applied to the JSON-LD representation, with algorithm identifiers.

## Consequences

To be completed. Open: how trust is conveyed over transports too small to carry signatures (AIS, NMEA 2000).
