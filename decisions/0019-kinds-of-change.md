# 0019. Three kinds of change: create, update and delete

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Changes, Versions); Notices vocabulary; AIS binding; decision 0017; requirements NCF-SEM-002, NCF-SEM-030 to NCF-SEM-033, and NCF-VOC-NOT-001

## Context

The Notices vocabulary gave a notice four changes: creation, update, withdrawal and expiry.
The AIS binding says it carries the changes to a sighting or a notice, and the JSON-LD binding lets a participant receive changes, but neither says what a change is for Things in general.
The whale-sightings prototype announces three kinds of event: created, updated and deleted.

Withdrawal and expiry both end a notice's validity, but a withdrawal is a message the receiver must hear, while an expiry is known in advance from what the receiver already holds.

## Decision

- A Thing changes in one of three ways:
  - **create**: a Thing now exists, under a new identifier;
  - **update**: a Thing is modified, and keeps its identifier (NCF-SEM-002);
  - **delete**: a Thing is removed, and its identifier no longer identifies anything.
- Withdrawing or cancelling a Thing is a kind of update, not a deletion: the Thing still exists, and says that it has been withdrawn or cancelled.
  A notice that is withdrawn or expires is therefore updated, and remains available at its IRI (NCF-VOC-NOT-001).
- A Thing has one owner, and its changes are applied only by its origin, the server or servers that hold it for the owner, not as a proxy or cache (NCF-SEM-031).
  An origin can be split, as between a vessel and its shadow; its servers are responsible for consistency across the split, as a replicated database's replicas are, and merge any branches of a Thing's versions (NCF-SEM-032); how is for them (decision 0020).
  Every other copy is a cached representation, updated only with changes attributed to the owner, by signature or by trust in the transport (NCF-SEM-033).
  A cached representation that applies a scheduled change holds the version the origin produces, so it remains a cached representation.
- Whether a deleted Thing's identifier may later identify another Thing is left to the authority that assigns it.
- A change can be scheduled: given in advance, with the time at which it takes effect: "if you don't hear otherwise, apply this change then".
  Expiry is a scheduled update, so a receiver applies it even when it has lost contact with the publisher.
- A create is never scheduled.
  A Thing that comes into force later is created at once, with a scheduled update that brings it into force, so that the date can be changed.
- A scheduled change names the version of the Thing it was scheduled against, and a receiver applies it at its time only if the Thing is still at that version (NCF-SEM-030).
  Any change to the Thing cancels the changes scheduled against its earlier version, so that none takes effect inadvertently on a Thing its owner has since revised; an owner restates in each change those it means to keep.
  A schedule held within the Thing, such as a notice's validity, is restated by every update.
- A scheduled change is held within the Thing, or in another container the Thing references, such as a work queue.
  Over a transport that cannot carry references, it travels within the message, as an AIS Area Notice's duration does.
- Receivers that apply a scheduled change independently reach the resulting version eventually: copies of a Thing need not agree at every moment, since some participants are offline.
- Times are in UTC.
  A participant without a synchronized clock judges the time as best it can, and records in its copy's provenance that it did so.
- Each binding carries the three kinds of change in its own terms; how is left to the bindings.

## Consequences

Applied in the semantic model (a new Changes section, before Versions), the Notices vocabulary (the life of a notice, and its validity and status terms), the AIS binding (Representation), decision 0017, and the glossary (Cached representation, Change, Origin, Scheduled change).

The life of a notice becomes creation, updates, coming into force and expiry; withdrawal is no longer a change of its own.
A receiver needs a clock to apply scheduled changes, and a publisher must restate the scheduled changes it means to keep each time it revises a Thing.

How a receiver that applies a scheduled change identifies the resulting version is resolved by decision 0020: the scheduled change names it.

Still open: whether a delete can be scheduled, as well as an update; 
which kinds of update a notice distinguishes, such as withdrawn, cancelled and expired, and what each tells a receiver;
and how each binding announces changes, which the JSON-LD binding takes up under receiving changes.
