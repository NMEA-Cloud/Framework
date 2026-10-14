# 0016. Devices roll up to responsible parties

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Trust and security chapter; requirement NCF-SEM-003; decision 0014

## Context

Data produced by a device needs to be traceable to the people and organizations accountable for it.
On a chartered vessel, for example, several parties are accountable at once, each in a different role.

## Decision

- A device's identity rolls up to one or more responsible parties: persons, organizations and vessels.
- A device can have several responsible parties at once, each in a different role, such as the vessel's owners, a charter company, a charterer, the master or a crew member.
- Each link from a device to a responsible party is a relationship in the semantic model.

## Consequences

Applied in the Trust and security chapter (Devices and responsible parties), with Responsible party in the glossary.
Still open: vocabulary terms for the roles; recording the period of a relationship; who may assert a relationship and whether the party must confirm it; whether a device or a responsible party signs the device's data.
