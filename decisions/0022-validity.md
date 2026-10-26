# 0022. Validity as a scheduled update

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Changes: Validity); Notices vocabulary; decisions 0019, 0020 and 0021; requirements NCF-SEM-030, NCF-SEM-034, NCF-SEM-035 and NCF-VOC-NOT-001

## Context

Some values hold only for a while: a heading for a few seconds, an AIS target until it is lost.
A notice's period of validity was already expressed through scheduled changes (decision 0019), but nothing said how long any other value holds, how that relates to how long a cache may use a copy, or whether a receiver dropping old copies changes the Thing.

## Options considered

How a value lapses:

1. An update to the value, marking it as no longer current, keeping the Thing and its last value.
2. A deletion of the Thing.
3. The owner's choice in each case.

Granularity, given that versions and their scheduled changes are per Thing:

1. Every update restates the scheduled changes of every value in the Thing.
2. A value with a validity of its own is a Thing of its own.
3. Versions per property.

## Decision

- Validity, how long a value holds in the world, belongs to the Thing; cache freshness, how long a copy may be used before it is checked with the origin, belongs to the bindings, which may derive it from the Thing's next scheduled change.
- Validity is a scheduled update that marks the value as no longer current; each new value restates it with a later time, so the value lapses only when its updates stop, at the origin and at every cached representation.
- Option 1 for lapsing: a lapsed value keeps its last value, marked as no longer current, and the Thing is not deleted; a lost AIS target remains at its IRI, marked as lost.
- Option 2 for granularity: a value whose validity differs from the rest of a Thing's, such as a vessel's position, should be a Thing of its own (NCF-SEM-034).
- A value with no scheduled update holds until it is changed.
- A receiver's own policy for presenting a value, or for discarding a cached representation, is not a change to the Thing and is not published as one (NCF-SEM-035).
  NCF-VOC-NOT-001 binds a notice's origin; a receiver may discard its copy.

## Consequences

Applied in the semantic model (Validity, under Changes), the Notices vocabulary (after NCF-VOC-NOT-001), and the glossary (Validity).
Receivers can garbage-collect cached representations freely without affecting the Things they copied.
Things split further: a vessel's fast-changing values become Things it refers to.

Still open: how a value is marked as no longer current; whether every value states when it was measured or observed, as distinct from when its version was made.
