# 0003. Things as web resources, with JSON-LD as the reference representation

- **Status:** Proposed
- **Date:** 2026-10-13
- **Related:** Semantic model chapter; JSON-LD binding

## Context

The semantic model needs a way to identify Things and represent them, and the representation must map onto several transports.
The NMEA plenary presentation (September 2026) proposed choices for this.

## Options considered

To be completed.

## Decision (proposed)

- Things are web resources, identified by IRIs.
- Things are described by a semantic model whose schemas are themselves Things.
- HTTP is the baseline protocol for the JSON-LD binding.
- JSON-LD is the basic representation.

Open: whether JSON-LD is also the **reference representation** that every other binding maps to and from.

## Consequences

To be completed. Likely: reuse of existing linked-data vocabularies (schema.org, Darwin Core);
a need for compact identifiers on constrained transports.
