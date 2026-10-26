# 0023. Relationships as properties, or Things of their own

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Semantic model (Relationships, Origins, Validity, Versions); Observations vocabulary; Trust and security (Devices and responsible parties); decisions 0011, 0016 and 0022; requirements NCF-SEM-003, NCF-SEM-005 and NCF-SEM-006

## Context

NCF-SEM-003 made every relationship a Thing, identified with its from, to and type by IRI.
Most links, such as an occurrence's link to the organism it observed, need no identity, owner or versions of their own, and making each a Thing is heavy.
Darwin Core's `dwc:` terms hold text, so links such as `dwc:organismID` are not made by IRI in RDF, which decision 0011 left open.

## Options considered

For relationships:

1. Every relationship is a Thing.
2. A relationship is a property of the Thing it is from, and a Thing of its own only when it has properties of its own.

For Darwin Core links:

1. Declare `dwc:` identifier terms as IRIs in the JSON-LD context, contrary to Darwin Core's intent that they hold text.
2. Carry the identifier as text in the `dwc:` term and as an IRI in a framework property, and use `dwciri:` terms where they exist.
3. A framework property only.

## Decision

- Option 2 for relationships: a relationship is usually a property of the Thing it is from, stated by that Thing's owner and changed with its versions.
  A relationship with an owner, a period or a signature of its own, such as a charter or a device's link to a responsible party, should be a Thing of its own (NCF-SEM-005), whose owner may be a third party.
  Its period is its validity, and its earlier versions show which relationships held when.
- NCF-SEM-003 holds for both forms; for a property, the from is the Thing, the type the property and the to its value.
- A relationship stated by one party binds no one else.
  A relationship that binds both Things it relates, such as a responsible party's acceptance of responsibility for a device or a charter, is contractual, and a receiver treats it as holding only when the owners of both have signed it, or the one owner when both Things share it (NCF-SEM-006).
  A link to a responsible party is contractual, so no one can make a party responsible for data without its agreement.
- A relationship is stated once; the Thing it is to need not state the inverse, and finding relationships to a Thing is a query for an indexing service, outside the model.
- Option 2 for Darwin Core: a `dwc:` identifier term carries the identifier as text, a framework property carries it as an IRI, and `dwciri:` terms are used where they exist, such as `dwciri:recordedBy`.

## Consequences

Applied in the semantic model (Relationships), the Observations vocabulary (the Darwin Core relationships question, and a note on `dwciri:sex` and `dwciri:lifeStage`), the examples (the context and the sighting), Trust and security (Devices and responsible parties), and the glossary (Contractual relationship, Relationship).
This resolves decision 0011's open question on Darwin Core relationships not identified by IRIs.
It also resolves the responsible parties' questions of how the period of a relationship is recorded, by its validity and versions, and of who asserts a link to a responsible party and whether the party confirms it: both sign.
Darwin Core links are carried twice, as text and as an IRI.
