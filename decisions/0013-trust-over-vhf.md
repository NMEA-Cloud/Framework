# 0013. Trust over VHF through regulated transmission

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** AIS binding (Trust); Trust and security chapter; decision 0004

## Context

Persistent signatures do not fit in AIS messages, so the AIS binding cannot rely on them to establish trust over VHF.
Transmission over VHF is already regulated: in the United States, for example, networks of private AIS AtoN stations operate with U.S. Coast Guard endorsement.

## Decision

- Trust over VHF comes from regulation: transmissions are monitored and regulated under official policies.
- Shore stations transmit under a private AtoN identifier.

## Consequences

Applied in the AIS binding (Trust).
Receivers trust AIS information because of who is permitted to transmit it, not because it can be verified cryptographically.
Still open: how private AtoN identifiers are assigned to networks of shore stations, especially networks whose coverage overlaps.
