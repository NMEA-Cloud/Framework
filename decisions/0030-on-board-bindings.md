# 0030. Identity, changes, validity and trust in the sentence and PGN bindings

- **Status:** Provisional
- **Date:** 2026-10-25
- **Related:** Sentence binding; PGN binding; AIS binding (Transport mechanics, Changes over AIS); semantic model (Identity, Validity, Origins); decisions 0013, 0021, 0022, 0025 and 0029; requirements NCF-SEM-004 and NCF-SEM-012

## Context

The sentence and PGN bindings left their mechanics, representation, fidelity and trust to be written.
Decisions 0019 to 0029 define aliases, changes, validity, origins, provenance and the AIS binding's view of repetition.
Gateways today pass AIS messages to displays on board, including ones they synthesize for information received over IP.

## Decision

- On board, sources are known by aliases, not identities: on NMEA 2000 a device's source address, until addresses are next claimed, and its NAME, which lasts longer but can change; on NMEA 0183 a talker identifier together with the port.
  A source heard on the vessel's network is a Thing whose opaque IRI the vessel assigns, as the authority for its own network.
- A message is a change if it changes anything about a Thing, its validity included: a repeated reading is a change, since it renews validity; a repeated AIS notice is not, since its validity has a fixed end.
- NMEA 0183 and NMEA 2000 do not say how long a value holds, so the bindings derive validity from the interval at which the source transmits.
- Both provide for requesting a message's transmission; messages otherwise arrive unsolicited, each the change itself.
- What is lost on board (the IRI, references, version, signature, usage terms, and provenance beyond the source's aliases) makes anything held from the bus alone incomplete; units and resolution are fixed by the message definitions.
- On-board networks are not authenticated; trust comes from physical access. The vessel's gateway is the origin of the Things it makes from bus messages and signs them as the vessel; the messages are not Things, and their identifiers and sources go in the provenance of what is made from them.
- Relaying an AIS message the vessel received over VHF to its network is a relay. Synthesizing one on board, as for a notice received over IP, is done today but borrows VHF's trust, and may be prohibited in future.

## Consequences

Applied in the sentence binding and the PGN binding (Getting current state and Receiving changes for NMEA 0183 and NMEA 2000, Identity and changes, Fidelity, Trust), the AIS binding (Relaying and synthesizing on board, and the repetition rule under Changes over AIS), the semantic model (the change rule under Validity), and the glossary (NAME, Talker identifier).

Still open: how a gateway gives displays a notice received over IP without synthesizing AIS messages, and whether new PGNs or sentences are needed; how a display tells a relayed AIS message from a synthesized one.
