# 0029. Changes, cancellation, aliases and vessels over AIS

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** AIS binding (Transport mechanics, Representation, Fidelity, Identity); semantic model (Changes, Validity, Versions); decisions 0012, 0017, 0019, 0020 and 0022; requirements NCF-SEM-012, NCF-SEM-030, NCF-SEM-034, NCF-SEM-035 and NCF-BND-AIS-003 to NCF-BND-AIS-005

## Context

Decisions 0019 to 0022 define the kinds of change, scheduled changes, versions and validity.
AIS carries repeated messages rather than kinds of change, has no version, and identifies a Thing only by an alias whose linkage identifier is reused.
The binding did not say how its messages map to changes, when an alias ends, how an AIS copy relates to the owner's version fetched over IP, or how vessels heard over AIS are represented.
The DAC 366 Area Notice and DAC 367 Geographic Notice specifications cancel a notice with a message under the same linkage identifier, with the cancellation area type, a duration of 0 and a start time marked not available.
The IALA ASM collection gives the rate at which either notice is repeated as an operational choice, nominally every five minutes, and lists the DAC 366 Area Notice as deprecated in favor of the DAC 367 Geographic Notice.

## Decision

- Each AIS message is the change itself; a receiver tells the kind of change by alias: the first message under an alias is a create, one with different content an update, and an identical repetition no change.
- AIS has no delete; a cancellation is an update that withdraws the notice.
- A notice's start time and duration are its scheduled updates, applied by UTC; a notice a receiver stops hearing holds until it expires or is canceled (NCF-BND-AIS-003).
- An alias lasts until its Thing expires or is withdrawn; a later message under the same identifiers is a new Thing (NCF-BND-AIS-004).
- Once a receiver holds the owner's version fetched over IP, a change heard only over AIS is marked unconfirmed until the receiver fetches again (NCF-BND-AIS-005), and a disagreement with the owner's version is flagged as possibly not the owner's.
- What AIS loses (the IRI unless a Linked Text carries it, references, version, signature, usage terms, and provenance beyond the transmitting station) makes anything held from AIS alone incomplete.
- A vessel heard over AIS is a Thing, with its MMSI as an alias; its dynamic properties, such as position, speed over ground and course over ground, are a Thing of their own whose validity is set from its reporting interval, after which they are marked lost; its static data are part of the vessel.

## Consequences

Applied in the AIS binding (Receiving changes; Changes over AIS and Vessels under Representation, with a row in the concept table; Fidelity; Identity of sightings and notices), the references (the DAC 366 and DAC 367 notice specifications, and ITU-R M.585 for MMSIs), and the glossary (MMSI).

Still open: which of the two notices should carry a notice, given the deprecation and what displays in service show of each; whether the IMO and DAC 200 notices cancel in the same way; what an undefined duration means; which reporting intervals set a vessel's validity, and after how many missed reports it is lost; whether the unique identifier the DAC 367 Geographic Notice anticipates would serve as a longer-lived alias.
