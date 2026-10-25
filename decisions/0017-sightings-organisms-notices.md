# 0017. Sightings, organisms and notices as distinct Things

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Observations vocabulary; AIS binding; whale sightings application; decisions 0011 and 0012; requirements NCF-SEM-002 and NCF-SEM-013

## Context

Decision 0012 carries a sighting from shore to ship in an Area Notice whose sub-area is a point, and official management areas in Area Notice and Geographic Notice ASMs.
Neither it nor the observations vocabulary says how a sighting relates to the organism it observed, or to a notice an authority issues about that organism,
such as a zone in which vessels are asked to slow down, with its own period of validity and its own originator.
Because the same ASM carries both, a sighting and a notice are easily taken for one another, giving one Thing two originators and two meanings, contrary to NCF-SEM-011.

Darwin Core already distinguishes an organism, which has an identity and a life history, from an occurrence, which records the organism's state at a place and time.

## Decision

- A **sighting** is an observation of one or more organisms, represented as decision 0011 describes: a `dwc:Event`, a `dwc:Occurrence`, or an event containing occurrences.
- An **organism** is a Thing in its own right, identified by an IRI: a particular whale, or a group recorded as one, such as a pod.
  An occurrence refers to the organism it observed with `dwc:organismID`.
- A sighting may lead to an update of the organism it observed, such as its last known position or its health, made by whoever is responsible for the organism, with the sighting as its source.
- A **notice** is a Thing produced by an authority, such as an exclusion zone a management agency creates around a whale.
  A notice may refer to the organisms it concerns.
- A **management area** is a Thing of its own, usually defined in regulation, not a notice.
  A notice refers to it: to announce it, its activation for a period, or a change to it.
  Decision 0012's official management areas carried in Area Notice and Geographic Notice ASMs are, in these terms, the notices that announce them.
- A management area's area is fixed, or relative to another Thing, such as within 1000 m of an organism, moving with it;
  a relative rule may be given for a species, applying around every organism of it.
  A notice of a relative management area says whether it is active, for example inactive when the organism's position is too uncertain.
  A zone that no standing rule describes is instead a notice with an area of its own; a zone around a whale may be either.
  Over AIS, a zone that moves is carried with the area it covers at the time, each move an update.
- Anyone can issue a notice, since a participant cannot be prevented from publishing or transmitting one.
  Whether a receiver acts on a notice depends on its relationship to the issuer and its trust in the issuer's identity, which differs by transport: a data owner's identity over IP, the regulation of transmission over VHF.
- A notice that is withdrawn or expires remains available at its IRI, marked as withdrawn or expired, so that references to it do not dangle (NCF-VOC-NOT-001).
  How revisions are identified is left to the semantic model, for every kind of Thing.
- Sightings and notices are carried at full fidelity by the JSON-LD binding.
- The AIS binding carries the changes to a sighting or a notice (its creation and its updates, withdrawal and expiry among them, as decision 0019 has it), which may not carry its references:
  an ASM can say that an area concerns marine mammals, but not which one.
  A sighting is carried, as decision 0012 has it, in an Area Notice ASM whose sub-area is a point; a notice in an Area Notice or Geographic Notice ASM.
- An ASM's name belongs to the transport, not to the concept: a sighting carried in an Area Notice ASM is still a sighting, not a notice.
- Proposed for testing: a sighting or notice carried over AIS also carries its IRI, for example in a Linked Text ASM with the same linkage, so that a receiver can retrieve the full Thing when it has an IP connection.
  So that the receiver can match the two, the Thing published over IP states every station and linkage identifier it is carried under (NCF-BND-AIS-001), and a receiver checks it, since an IRI heard over VHF is only a claim.
- A notice's identifier is its issuer's IRI, and every participant that holds or relays it uses that IRI once it knows it (NCF-VOC-NOT-002).
  A receiver's copy is the notice itself; what the receiver knows of its copy, when and how it was received and whether it is complete, is the copy's provenance.
- Over AIS, a station and linkage identifier is an alias, not an identity: temporary, since linkage identifiers are reused, and one of several when a network of stations transmits one Thing.
  A receiver that hears a sighting or notice over AIS alone holds it under a local identifier of its own, marked incomplete, and when it learns the IRI identifies it by the IRI and treats every alias linked to it as the same Thing (NCF-BND-AIS-002).

## Consequences

Applied in the Observations vocabulary (Sightings and organisms), a new Notices vocabulary (what a notice holds, its life, its kinds, management areas and authorities), the core vocabulary's candidate terms, the AIS binding (Applications, Representation, Fidelity, Trust and Requirements), the whale sightings application, and the glossary (Authority, Notice, Organism, Sighting).

Decisions 0011 and 0012 stand; this record adds the organism and the notice as Things, and says that an ASM's name does not decide the concept it carries.
A receiver has to tell whether an Area Notice ASM carries a sighting or a notice.

Still open: the form of a receiver's local identifier, which depends on decision 0006, and how a Thing is marked incomplete; how relative areas are expressed; whether a relative area grows with the uncertainty of the position it follows, or its notice goes inactive; whether a rule for a species is one management area or one per organism; whether a notice's status is a property or an inactive zone a withdrawal;
how a receiver tells whether an Area Notice ASM carries a sighting or a notice (proposed decision 0018 suggests a Sighting ASM, and defined text in an Area Notice), and what its start time and duration mean for a sighting;
whether every occurrence names an organism, the observer creating one when the organism is not known;
how an IRI is written in the six-bit characters of AIS, which have no lower-case letters;
how a receiver tells a Linked Text carrying an IRI from one carrying words;
and whether an Area Notice can have more than one Linked Text.
