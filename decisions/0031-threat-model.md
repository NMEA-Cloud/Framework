# 0031. A threat model, distrust statements and sealed parts

- **Status:** Provisional
- **Date:** 2026-10-26
- **Related:** Trust and security (Threat model, Distrust statements); Architecture (Participants); Semantic model (Versions); Notices vocabulary; decisions 0013, 0014, 0024 and 0025; requirements NCF-SEM-044, NCF-TRU-007 to NCF-TRU-015, and NCF-VOC-OBS-002

## Context

The Trust and security chapter left its threat model to be written: the assets, threat actors and threats, and which mechanisms answer each.
Decisions 0019 to 0030 settled most of those mechanisms, so the threat model can now map threats to them and record what they leave open.

An observation raised in discussion, not checked against any policy or guidance and not stated in the document: vessels required to carry AIS are seen to switch it off where transmitting puts them at risk, such as of piracy or missile attack.
Situational disclosure of a vessel's position would serve the same need.

## Decision

- The threat model is a list of assets, threat actors and threats, each threat with the mechanisms that answer it and what remains.
  Requirements are added only where a gap calls for one.
- Physical jamming of VHF or GNSS, and denial of service against internet services by sheer volume, are out of scope, since they need mitigations outside the framework.
  Amplification and query storms that the framework's own mechanisms could cause are in scope.
- Spoofing, including spoofed GNSS position and time: signatures and designations over IP, regulation over VHF, and changes heard only over AIS marked unconfirmed.
  Mariners are reminded to use information received over AIS with due caution.
  A receiver should not act automatically on information it cannot attribute to a source it treats as authoritative (NCF-TRU-007).
- Suppression: an authority publishes its current notices as a collection with versions of its own, so that a receiver whose copy is fresh knows it holds every current notice (NCF-TRU-008).
  DNSSEC's authenticated denial of existence is given as an example of the same approach.
- Replay over IP: a receiver never replaces its copy of a Thing with a version its copy descends from (NCF-SEM-044).
- Replay over AIS is accepted under VHF regulation: a rule to tell a replay from a reissue would fail on edge cases, such as a notice replayed a year later, since its start time carries no year.
- Compromised sources: anyone can publish a **distrust statement**, saying that a receiver should not rely on other Things, some of their versions, or what a source made over a period.
  From the owner of the data, it is the owner's revocation.
  From another party, it is either an audit or a denial of information, and the receiver decides which by its trust in that party.
- Injection on board: NMEA 0183 and NMEA 2000 networks are not authenticated, so a gateway, a wireless device or a compromised device can inject messages; some vessel networks are moving toward zero trust architectures, but most are not there yet.
- Amplification and query storms: the mitigations common to applications reachable from the internet, including authorization of subscriptions and requests.
- Privacy:
  - every disclosure opens information to correlation and inference, which the framework can limit at the point of disclosure but not afterward;
  - authenticity and privacy pull against each other, since a signed position is a record its signer cannot deny;
  - anonymization is fragile to correlation;
  - a collection discloses its members, as a DNSSEC zone's chain of names does;
  - a part of a Thing that is not for every receiver is **sealed**: encrypted within the Thing, and covered by its signature in that form (NCF-TRU-010).
    A sealed copy is complete though not wholly readable, sealed against modification, the same for every receiver, and its own placeholder.
    Whether a sealed part shows the property it holds is the owner's choice;
  - an owner may seal any of a Thing's content, its provenance included, but never its **envelope**, what the framework reads to handle the Thing: its IRI and type, its version and the versions it succeeds, its validity and scheduled changes, its usage terms, its proofs and the protected headers of its sealed parts (NCF-TRU-014).
    The type in the envelope says what kind of Thing it is, such as a sighting; a finer kind, such as the species, is content;
  - a key is given when a receiver shows a need to know, before or after it receives the copy, and cannot be taken back, so giving it is a matter of trust in the receiver.
    Keys are best used once: a key unseals one part of one version alone (NCF-TRU-011);
  - a sealed part is encrypted directly (`dir`) with a single-use content key, and names it by `kid` as the IRI of a Thing that holds it (NCF-TRU-012).
    The key's Thing has its own authorization policy, and is given to each receiver encrypted to that receiver's public key, as an encrypted JWK (NCF-TRU-013), so that caches and relays can carry it and it can be sent ahead to a receiver that will be out of contact.
    `jku` was considered and not used: it names the recipient's public keys, not a shared key.
    Encrypting the content key to each reader within the Thing was also considered, and not used, since it needs the readers known when the part is sealed;
  - a receiver can give the public key to encrypt to in its request, with a fresh key pair for each request if it chooses.
    Such a request uses an access token bound to the client, by DPoP or mutual TLS, and is signed unless it travels directly over TLS, so that neither a stolen token nor a relay can substitute another key (NCF-TRU-015).
    A key sent ahead of time is encrypted to a public key the receiver publishes or its certificate holds;
  - applications rely on sealing, not on making data less specific.
    Omission by a selective disclosure cryptosuite remains possible, with a placeholder that every disclosure includes: `dwc:informationWithheld` for observations (NCF-VOC-OBS-002);
  - an **intermediary** stands between sources and receivers: sources report information to it, it derives Things from what they report, attributed to itself, and publishes them to receivers, and it can prove the derivation and its sources, held in a sealed part, to those with a need to know.
    Sighting networks and hazard services are examples, and a vessel's shadow can act as one for its vessel;
  - parties are referred to in layers, from token to opaque identifier to name, each resolved on a need-to-know basis, and by an opaque identifier wherever disclosing who they are is not required (NCF-TRU-009);
  - disclosure is situational, for example a vessel's position kept private normally, disclosed nearby when there is a risk of collision and to everyone in an emergency.
    Widening who may read a Thing makes no new version, and cannot be undone; disclosure in an emergency adds to distress alerting and does not replace it;
  - a vessel that a jurisdiction requires to transmit its position over AIS discloses it there, whatever it keeps private elsewhere;
  - data protection law differs between jurisdictions, and a vessel may be subject to several at once, changing as it voyages.

## Consequences

Applied in the Trust and security chapter (Threat model, and Distrust statements under Provenance and authority), the Architecture chapter (Participants), the JSON-LD binding (Trust), the semantic model (Versions), the Notices vocabulary (Authorities), the Observations vocabulary (Withheld information), the glossary (Content key, Distrust statement, DNSSEC, Envelope, Intermediary, Sealed part, Selective disclosure, Zero trust architecture) and the references.

An authority must maintain a collection of its current notices, and a receiver must keep track of which versions it has held.
An owner that seals parts of its Things must keep a Thing for each content key, and a receiver that is given keys needs a key pair for encryption.

Which parts of a vocabulary's Things may be sealed needs no answer per vocabulary: any content may be, at the owner's choice, and the envelope never is.

Still open: the terms for a distrust statement and how it names versions or a period;
how an owner whose key is compromised signs a distrust statement that receivers can trust, alongside the open question of certificate revocation (decision 0014);
how a receiver publishes the public key that keys sent ahead of time are encrypted to, and which terms and algorithms seal a part;
how a request for a content key gives the client's public key over HTTP and CoAP;
and which terms mark omitted information outside observations.
How a collection is identified remains open in the semantic model.
