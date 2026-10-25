# 0018. Sightings over AIS: a Sighting ASM, and defined text in an Area Notice

- **Status:** Proposed
- **Date:** 2026-10-25
- **Related:** AIS binding (Representation, Fidelity); Observations vocabulary; decisions 0011, 0012 and 0017

## Context

Decision 0012 carries a sighting from shore to ship in an Area Notice ASM whose sub-area is a point.
That reaches displays that already show Area Notices, but it loses most of the sighting:
what was seen, how many, the breakdown into occurrences (decision 0011), which way the animals were heading, how well the position is known, and who observed it.

It also leaves a receiver unable to tell a sighting from a notice.
An Area Notice is an authority's statement about an area, and a notice may itself be a point,
so a point Area Notice may carry either (decision 0017, which says that an ASM's name belongs to the transport, not to the concept it carries).

This record assumes that no existing ASM carries a sighting.
That is to be confirmed against the IALA collection of ASMs.

## Options considered

1. **A point Area Notice only, as now.** Shown by existing displays; carries almost nothing of the sighting, and cannot be told from a notice.
2. **A point Area Notice with defined text.** Text in a fixed form that people can read and software can recognize.
   Still shown by existing displays; carries what was seen, how many and the heading, in as much text as fits; marks the message as a sighting.
3. **A Sighting ASM.** A message of its own, carrying the sighting's content compactly.
   Unambiguous and as complete as AIS allows; but it needs a DAC and FI to be allocated, and displays show nothing of it until manufacturers implement it.
4. **Both 2 and 3.** The Sighting ASM for receivers that know it; the point Area Notice with defined text for the displays in service.

## Decision (proposed)

Option 4.

### A Sighting ASM

A Sighting ASM, broadcast in message 8 and addressed in message 6, carries one sighting: an event and one or more occurrences (decision 0011).
On board it travels in the PGNs and sentences that carry ASMs already, so it needs no new PGN or sentence.

A first sketch of its content, with rough sizes:

| Content | Darwin Core | Bits |
|---|---|---|
| Version and linkage identifier, so that a Linked Text can be tied to it, as for other ASMs | | 16 |
| When it was seen: month, day, hour and minute, UTC | `dwc:eventDate` | 20 |
| Where: longitude and latitude in ten-thousandths of a minute, as AIS position reports carry them | `dwc:decimalLongitude`, `dwc:decimalLatitude` | 55 |
| How well the position is known, as a coarse code | `dwc:coordinateUncertaintyInMeters` | 4 |
| Observed by a person or a machine; detected, or no longer detected | `dwc:basisOfRecord`, `dwc:occurrenceStatus` | 2 |
| Spare | | 1 |
| Direction of travel, in degrees, or not available | `dwc:behavior`, in part | 9 |
| For each occurrence: the taxon, as a WoRMS AphiaID | `dwc:scientificNameID` | 22 |
| For each occurrence: how many, or not available | `dwc:individualCount` | 7 |
| For each occurrence: life stage, as a code | `dwc:lifeStage` | 3 |

The fixed part is 107 bits and each occurrence 32.
In two slots, message 8 has room for six occurrences and message 6 for five; one slot is too small.

The taxon is identified by its AphiaID in the World Register of Marine Species (<https://www.marinespecies.org/>), a number rather than a code table the framework would have to maintain.
An AphiaID gives the IRI `urn:lsid:marinespecies.org:taxname:<AphiaID>`; *Orcinus orca*, for example, is 137102.
AphiaIDs issued up to October 2026 are below 2 000 000, so 22 bits leave room for growth.

The sighting's IRI, its observer and anything else that does not fit are carried as decision 0017 proposes for any Thing carried over AIS: by the IRI, in a Linked Text with the same linkage.

### Defined text in a point Area Notice

A sighting sent in a point Area Notice carries text in a fixed form, readable as it stands on a display, beginning with a keyword that marks it as a sighting.
For example:

```
SIGHTED 3 RIGHT WHALES HDG 090
SIGHTED 5 ORCA 2 CALVES
```

The names are common names from a list in the Observations vocabulary, each mapped to a taxon.
The text is carried in the Area Notice's own text where it fits, and otherwise in a Linked Text with the same linkage.
A receiver that recognizes the form takes the message as a sighting; one that does not shows the text as it is.

## Consequences

If accepted: the AIS binding gains the Sighting ASM and the defined text in its Representation, with what each loses in its Fidelity;
the Observations vocabulary gains the list of names and the codes for position uncertainty and life stage;
and a receiver can tell a sighting from a notice, by its ASM or by its text.

A station may send a sighting both ways, and a receiver that knows both then hears it twice.

Still open:

- Who allocates the Sighting ASM's DAC and FI: a national administration for a regional DAC, or IMO for the international one.
- Whether an existing ASM already carries sightings.
- How a station tells which form a receiver can use, and whether a receiver that hears both under one linkage shows them as one.
- The grammar of the defined text, including life stages, a heading, and a sighting no longer detected; and how much text an Area Notice can carry.
- The list of names, and how names that differ by region are handled (a right whale in the North Atlantic is not the species of the North Pacific).
- The codes for position uncertainty and life stage, which depend on the controlled vocabularies still open in decision 0011.
- Sightings from vessels whose AIS stations cannot transmit ASMs (see the AIS binding's constraints).
