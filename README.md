# NMEA Cloud Framework

A living definition of how the NMEA Cloud Framework works: a common semantic model for maritime information,
kept consistent across IP, AIS, NMEA 0183 and NMEA 2000, so that vessels and shore services share real-time situational awareness.

**Read it:** <https://nmea-cloud.github.io/Framework/>

> **Status:** living framework document under active development — not an NMEA standard.
> Dated PDF snapshots are attached to [releases](https://github.com/NMEA-Cloud/Framework/releases).

## Structure

| Part | Folder | Contents |
|---|---|---|
| I — Overview | `overview/` | Introduction, architecture, semantic model, trust and security |
| II — Vocabularies | `vocab/` | Domain modules: core, observations, vessel data |
| III — Bindings | `bindings/` | JSON-LD, AIS, sentences (NMEA 0183, IEC 61162-450), PGNs (NMEA 2000, OneNet) |
| IV — Applications | `applications/` | Whale sightings, vessel data recording |

Design decisions are recorded in [`decisions/`](decisions/).

## Working on it locally

1. Install [Quarto](https://quarto.org/docs/get-started/) and, optionally, VS Code with the Quarto extension.
2. Clone the repository and run `quarto preview` in it. A browser window shows the document and reloads as you edit.

## Contributing

Human and AI contributors are both welcome and follow the same process: an issue, a branch, a pull request, a review.
See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the workflow and [`AGENTS.md`](AGENTS.md) for the writing conventions and rules.

## Publishing

- Every merge to `main` publishes the website (`.github/workflows/publish.yml`).
- Every pull request is built and link-checked (`.github/workflows/check.yml`).
- Pushing a tag such as `2026.1` creates a release with a dated PDF snapshot (`.github/workflows/snapshot.yml`).

## License

Safety information should not be confined to proprietary silos, so everything here is openly licensed:

| Material | License |
|---|---|
| Framework text | [CC BY 4.0](LICENSES/CC-BY-4.0.txt) |
| Vocabularies and schemas (`vocab/`) | [CC0 1.0](LICENSES/CC0-1.0.txt) — public domain |
| Code, tools, configuration and examples | [Apache 2.0](LICENSES/Apache-2.0.txt) |

Data published by others using the framework's vocabularies is not covered by these licenses; its publisher sets its terms.
See [`LICENSE`](LICENSE) for details.
