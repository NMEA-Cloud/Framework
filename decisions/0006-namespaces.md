# 0006. Namespaces for identifiers

- **Status:** Open — to do
- **Date:** 2026-10-13
- **Related:** Semantic model chapter (Identity, Namespaces); decision 0005

## Context

Every Thing is identified by an IRI (NCF-SEM-001), so the framework needs to say who may define identifiers, and where.
This matters most for the marine domain, where several naming authorities are likely to coexist:

- **NMEA** may want its own namespace for its definitions, for example `https://schema.nmea.org/` (or a similar domain).
- **Open communities such as Signal K** have their own models and may want to define things their own way.
- **Maritime Resource Names** (MRNs, `urn:mrn:…`) are a registered URN namespace managed by IALA,
  used by the Maritime Connectivity Platform and Smart Shipping initiatives to identify maritime resources and organizations.
- **Persistent redirect services** such as w3id.org give stable identifiers independent of where content is hosted.
  The current leaning is to use one for the framework's own terms, but not every participant will want to go through a third-party redirector.

Identifiers are permanent: once data is published using them, changing them breaks it. This must be settled before any term is marked stable.

## Questions to resolve

1. **One namespace or many?** Most likely many. If so, what rules must any namespace meet to be used in the framework
   (persistence, resolvability, a stated governing authority)?
2. **Where do the framework's own core terms live?** w3id.org, a domain the project controls, or one operated by NMEA?
3. **Equivalence between namespaces.** How are equivalent or related terms in different vocabularies linked
   (for example an NMEA term, a Signal K path and a framework term for the same quantity)?
4. **MRNs.** How do MRN-identified resources take part? MRNs are URNs, so they are valid IRIs, but they do not resolve over HTTP without a resolver.
5. **Terms versus instances.** Vocabulary terms (what a "sighting" is) and instance identifiers (this vessel, this sighting)
   probably need different rules. How are existing vessel identifiers (MMSI, IMO number, MRN) expressed?
6. **Resolution.** What should a client get when it dereferences an identifier — documentation for people, JSON-LD for software?
7. **Compact identifiers** for constrained transports (AIS, NMEA 2000): prefixes, registries or numeric codes?
8. **Trust.** Should control of a namespace be tied to the keys that may sign definitions in it?

## Options considered

To be completed.

## Decision

None yet.

## Consequences

To be completed.
