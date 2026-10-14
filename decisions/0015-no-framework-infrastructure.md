# 0015. The framework operates no runtime infrastructure

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Architecture (tenets); Trust and security chapter; decision 0014

## Context

Trust and distribution mechanisms, such as certificate authorities, revocation lists and transparency logs, need someone to operate them.
If the framework operated them, it would become a central operator and a single point of failure.

## Decision

- The framework operates no infrastructure, and in particular none needed at runtime.
- Participants, or existing public services, provide certificate authorities, revocation lists, transparency logs and any other runtime services.

## Consequences

Applied in the Architecture chapter (the "No central operator" tenet) and in the Trust and security chapter (Data owners).
The framework specifies how such services are used, not who runs them.
Still open: whether a tier 1 trust list published with the framework counts as infrastructure, and who maintains it.
