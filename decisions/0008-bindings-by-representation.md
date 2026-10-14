# 0008. Bindings by representation, with a section per transport

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Part III (Bindings); requirement NCF-SEM-010; decision 0005

## Context

Part III had one binding per on-board network: NMEA 0183 and NMEA 2000.
The same messages are carried over more than one transport:

- sentences over NMEA 0183 serial links and over Ethernet (IEC 61162-450);
- PGNs over NMEA 2000 (CAN) and over OneNet, which is link-local IP and allows longer messages.

The mapping between semantic concepts and messages is the part of a binding that carries meaning.
With one binding per network, that mapping would be written twice for sentences and twice for PGNs.

No binding requirements had been written, so restructuring did not affect any requirement identifiers.

## Options considered

1. **One binding per transport** (NMEA 0183, IEC 61162-450, NMEA 2000, OneNet). Familiar names; duplicated mappings that can drift apart.
2. **OneNet within the IP binding** (now the JSON-LD binding). OneNet uses IP, but its messages are PGNs, not web resources, so it shares nothing with that binding's representation.
3. **One binding per representation, with a section per transport.** Each mapping is written once; mechanics, fidelity and trust are given per transport.

## Decision

Option 3. A binding covers one representation and every transport that carries it:

| Binding | Transports |
|---|---|
| JSON-LD | HTTP, CoAP |
| AIS | VHF; on board, sentences (NMEA 0183, IEC 61162-450) and PGNs (NMEA 2000, OneNet) |
| Sentences | NMEA 0183, IEC 61162-450 |
| PGNs | NMEA 2000, OneNet |

The binding previously called the IP binding is the JSON-LD binding, since IP is a transport and is shared with OneNet.
The AIS binding keeps its name: its representation is AIS messages in general, not only application-specific messages.

Requirement identifier areas for bindings are `BND-JSONLD`, `BND-AIS`, `BND-SEN` and `BND-PGN`.

## Consequences

A new transport for an existing representation adds a section to that binding, not a new binding.
Fidelity and trust can differ between transports of the same binding, for example between NMEA 2000 and OneNet.
The network names NMEA 0183 and NMEA 2000 appear as transports, not as chapter titles.
Where one binding's messages are carried inside another's, such as AIS messages in sentences or PGNs on board, the outer messages are a transport of the inner binding.
On board, AIS messages are carried intact: encapsulated in sentences, or in PGNs, with a PGN for each AIS message type.
A receiver extracts the inner message and handles it under the inner binding, so the outer binding does not map the inner binding's concepts a second time.
