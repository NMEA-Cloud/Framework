# 0014. Data owners identified separately from servers

- **Status:** Provisional
- **Date:** 2026-10-14
- **Related:** Trust and security chapter; requirement NCF-TRU-001; decision 0004

## Context

A domain-validated certificate shows only that its holder controls a domain name.
That is enough to identify a server, but a receiver of a persistently signed Thing needs to know which organization or person originated it.
Identity verification such as that of an MCP identity registry gives high confidence, but is impractical for individual operators, especially in large numbers.

## Decision

- Servers are identified by WebPKI certificates, which can be domain validated.
- Data owners are identified separately from servers; a data owner's certificate verifies its persistent signatures.
- Tier 1, legal entity: the data owner's identity as a legal entity is verified, either by a certificate authority on the framework's trust list (such as a government certificate authority or an MCP identity registry), or by publishing its certificate on its own domain where the server's organization-validated or extended-validation certificate names the same organization.
- Tier 2, internet presence: only control of an internet identifier is verified, either a domain (certificate published on a domain whose server certificate is domain validated) or, for an individual, an OpenID Connect identity bound to the key by a short-lived certificate recorded in a transparency log.
- Working assumption for OpenID Connect providers: providers of commonly used operating system platforms, such as Apple (iOS and macOS), Google (Android) and Microsoft (Windows); other well-known providers, such as social media or maritime providers; and providers with which the receiver has a private trust relationship, such as organizations, non-governmental organizations and manufacturers.
- A receiver records which tier, and which way, applied.

## Consequences

Applied in the Trust and security chapter (Data owners), with Data owner, MCP, Transparency log and WebPKI in the glossary.
Root programs require hierarchies that issue TLS server certificates to be dedicated to TLS server authentication, so certificates from a trusted certificate authority come from other hierarchies.
Tier 2 needs little new infrastructure and suits individual operators at scale.
Still open: who maintains the tier 1 trust list and what it includes; the identity verification required; verifying signatures after a domain stops publishing a certificate; how a receiver decides which OpenID Connect providers it accepts, and who operates the certificate authority and log for individuals; revocation, timestamping, and recording the tier in provenance.
