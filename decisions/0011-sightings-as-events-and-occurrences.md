# 0011. Sightings as Darwin Core events and occurrences

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Observations vocabulary; requirement NCF-VOC-OBS-001; requirement NCF-SEM-003

## Context

A sighting can include groups of different kinds, such as five adult females with two calves.
Darwin Core's `dwc:individualCount` holds a single number, so one occurrence cannot express the breakdown.

## Options considered

1. **A single occurrence with a total count.** Simple, but loses the breakdown.
2. **An event containing one occurrence per group.** Keeps the breakdown, and is how Darwin Core models it.

## Decision

- Biological observations reuse Darwin Core.
- A sighting is either a single `dwc:Occurrence` or a `dwc:Event` containing one or more occurrences, and consumers accept both (NCF-VOC-OBS-001).
- `dwc:sex` and `dwc:lifeStage` describe the organisms counted in an occurrence.
- `dwc:Organism` can identify a group recorded as one, such as a pod of orca.
- `dwc:ResourceRelationship` corresponds to a relationship in the semantic model.

## Consequences

Applied in the Observations vocabulary, with a worked example and the Event and Occurrence glossary entries.
Open questions remain on controlled vocabularies for sex and life stage, on Darwin Core relationships that are not identified by IRIs (NCF-SEM-003), and on carrying several occurrences over constrained transports.
