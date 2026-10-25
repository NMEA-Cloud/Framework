# Decision records

Each file records one significant design decision: the context, the options considered, what was decided and why.
They keep the reasoning behind the framework alongside the text, so it is not lost in meetings or chat threads.

## Needs group review

Provisional decisions are already applied in the document but have not been reviewed by the working group.
They are the priority for group review.

| # | Decision |
|---|---|
| [0005](0005-vocabulary-management.md) | Vocabulary licensing and management |
| [0007](0007-machine-readable-vocabularies.md) | Publish vocabularies as machine-readable files |
| [0008](0008-bindings-by-representation.md) | Bindings by representation, with a section per transport |
| [0009](0009-json-ld-over-http.md) | HTTP transport of the JSON-LD binding |
| [0010](0010-coap-transport.md) | CoAP as an alternative transport of the JSON-LD binding |
| [0011](0011-sightings-as-events-and-occurrences.md) | Sightings as Darwin Core events and occurrences |
| [0012](0012-ais-messages-for-concepts.md) | AIS messages for management areas, sightings and alerts |
| [0013](0013-trust-over-vhf.md) | Trust over VHF through regulated transmission |
| [0014](0014-data-owner-identity.md) | Data owners identified separately from servers |
| [0015](0015-no-framework-infrastructure.md) | The framework operates no runtime infrastructure |
| [0016](0016-responsible-parties.md) | Devices roll up to responsible parties |
| [0017](0017-sightings-organisms-notices.md) | Sightings, organisms and notices as distinct Things |
| [0019](0019-kinds-of-change.md) | Three kinds of change: create, update and delete |
| [0020](0020-versions.md) | Versions identified by IRIs of their own |
| [0021](0021-opaque-iris.md) | IRIs as opaque identifiers |
| [0022](0022-validity.md) | Validity as a scheduled update |
| [0023](0023-relationships.md) | Relationships as properties, or Things of their own |
| [0024](0024-data-integrity-signatures.md) | Persistent signatures as Data Integrity proofs over canonical RDF |
| [0025](0025-provenance-and-authority.md) | Provenance of Things and of copies, and authority by designation |
| [0026](0026-rights-and-usage.md) | Usage terms as licenses, by version and by inheritance |
| [0027](0027-notifications-and-change-requests.md) | Change notifications as links, and changes made by request |
| [0028](0028-versions-caching-contexts-over-http.md) | Versions, caching, contexts and deletion in the JSON-LD binding |
| [0029](0029-changes-and-vessels-over-ais.md) | Changes, cancellation, aliases and vessels over AIS |
| [0030](0030-on-board-bindings.md) | Identity, changes, validity and trust in the sentence and PGN bindings |

## All decisions

| # | Decision | Status |
|---|---|---|
| [0001](0001-record-decisions.md) | Record design decisions | Accepted |
| [0002](0002-living-document-toolchain.md) | Author as a living document in Quarto | Accepted |
| [0003](0003-things-as-web-resources.md) | Things as web resources, with JSON-LD as the reference representation | Proposed |
| [0004](0004-trust-stack.md) | WebPKI, OpenID Connect, OAuth 2.0 and JOSE for trust | Proposed |
| [0005](0005-vocabulary-management.md) | Vocabulary licensing and management | Provisional |
| [0006](0006-namespaces.md) | Namespaces for identifiers | Open — to do |
| [0007](0007-machine-readable-vocabularies.md) | Publish vocabularies as machine-readable files | Provisional |
| [0008](0008-bindings-by-representation.md) | Bindings by representation, with a section per transport | Provisional |
| [0009](0009-json-ld-over-http.md) | HTTP transport of the JSON-LD binding | Provisional |
| [0010](0010-coap-transport.md) | CoAP as an alternative transport of the JSON-LD binding | Provisional |
| [0011](0011-sightings-as-events-and-occurrences.md) | Sightings as Darwin Core events and occurrences | Provisional |
| [0012](0012-ais-messages-for-concepts.md) | AIS messages for management areas, sightings and alerts | Provisional |
| [0013](0013-trust-over-vhf.md) | Trust over VHF through regulated transmission | Provisional |
| [0014](0014-data-owner-identity.md) | Data owners identified separately from servers | Provisional |
| [0015](0015-no-framework-infrastructure.md) | The framework operates no runtime infrastructure | Provisional |
| [0016](0016-responsible-parties.md) | Devices roll up to responsible parties | Provisional |
| [0017](0017-sightings-organisms-notices.md) | Sightings, organisms and notices as distinct Things | Provisional |
| [0018](0018-sighting-asm.md) | Sightings over AIS: a Sighting ASM, and defined text in an Area Notice | Proposed |
| [0019](0019-kinds-of-change.md) | Three kinds of change: create, update and delete | Provisional |
| [0020](0020-versions.md) | Versions identified by IRIs of their own | Provisional |
| [0021](0021-opaque-iris.md) | IRIs as opaque identifiers | Provisional |
| [0022](0022-validity.md) | Validity as a scheduled update | Provisional |
| [0023](0023-relationships.md) | Relationships as properties, or Things of their own | Provisional |
| [0024](0024-data-integrity-signatures.md) | Persistent signatures as Data Integrity proofs over canonical RDF | Provisional |
| [0025](0025-provenance-and-authority.md) | Provenance of Things and of copies, and authority by designation | Provisional |
| [0026](0026-rights-and-usage.md) | Usage terms as licenses, by version and by inheritance | Provisional |
| [0027](0027-notifications-and-change-requests.md) | Change notifications as links, and changes made by request | Provisional |
| [0028](0028-versions-caching-contexts-over-http.md) | Versions, caching, contexts and deletion in the JSON-LD binding | Provisional |
| [0029](0029-changes-and-vessels-over-ais.md) | Changes, cancellation, aliases and vessels over AIS | Provisional |
| [0030](0030-on-board-bindings.md) | Identity, changes, validity and trust in the sentence and PGN bindings | Provisional |

## Statuses

Open
: A question not yet ready for a proposal.

Proposed
: Put forward for discussion; not yet applied in the document.

Provisional
: Decided by the editors and applied in the document, but not yet reviewed by the working group.

Accepted
: Agreed by the working group.

Superseded by NNNN, Rejected
: Replaced by a later decision, or turned down.

## Process

1. Copy [`template.md`](template.md) to `NNNN-short-title.md`, using the next number.
2. Set the status:
   **Proposed** for a suggestion, **Provisional** for a decision already applied in the document (a short record is enough), or **Open** for a question not yet ready for a proposal.
   Add Provisional records to *Needs group review* above.
3. Open a pull request. Discussion happens on the pull request.
4. When the working group agrees, change the status to **Accepted** and remove the record from *Needs group review*.
5. A decision is never deleted. If it is replaced, mark it **Superseded by NNNN** and link to the new record.
