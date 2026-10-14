# 0012. AIS messages for management areas, sightings and alerts

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** AIS binding; decision 0011

## Context

The AIS binding needs to say which AIS messages carry which framework concepts.
Existing ASMs are already used for official management areas.

## Decision

- Official management areas are carried in the Area Notice and Geographic Notice ASMs, as they are today.
- A management area alert is carried in message 12, with text identifying the area and the regulation; an addressed Area Notice ASM is a candidate, to be tested.
- A sighting is carried from shore to ship in an Area Notice whose sub-area is a point.
- A local alert is carried in message 14 with defined text.
- The Linked Text ASM is a candidate for carrying additional information about any of these.

## Consequences

Applied in the AIS binding (Representation).
Sightings reuse an existing ASM rather than a new one, at the cost of carrying only what an Area Notice can express.
Still open: whether an Area Notice can carry a sighting from ship to ship or ship to shore, the text of the message 14 alert, and whether the Area Notice ASM replaces or supplements message 12 for management area alerts.
