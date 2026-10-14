# Contributing

Thank you for helping develop the NMEA Cloud Framework.
Contributions from people and from AI agents follow the same process and the same rules.

## Ways to contribute

- **Comment or ask a question:** open an [issue](https://github.com/NMEA-Cloud/Framework/issues).
  Every page of the published document has a "Report an issue" link.
- **Discuss a design question:** open an issue labeled `question`, or a decision record (see below).
- **Propose a change to the text:** open a pull request.

## Workflow

1. **Start from an issue** for anything beyond a small editorial fix, so the change can be discussed before it is written.
2. **Create a branch** from `main`.
3. **Edit and preview** locally with `quarto preview`.
4. **Check the build:** `quarto render --to html` must succeed without warnings.
5. **Open a pull request** that links the issue and explains what changed and why.
   A pull request can be marked *Draft* while it is still being worked on.
6. **Review:** changes to requirements need approval from a working-group member. Editorial changes need any one review.
7. **Merge:** the website updates automatically.

## Licensing and sign-off

Contributions are made under the repository's licenses (see [`LICENSE`](LICENSE)):
CC BY 4.0 for text, CC0 for vocabularies, Apache 2.0 for code and examples.
You keep the copyright in your contribution.

Every commit must be signed off under the [Developer Certificate of Origin](https://developercertificate.org/) (DCO),
certifying that you have the right to submit it under those licenses.
Add the sign-off with `git commit -s`, which appends a line like:

```
Signed-off-by: Your Name <you@example.org>
```

If you used an AI agent, **you** sign off: you are certifying the contribution, so review it first.
Do not submit material copied from documents you do not have the right to relicense —
in particular, do not copy text or definitions from licensed standards, including NMEA standards.
Refer to them by name and identifier instead.

## Writing conventions

The conventions — one sentence per line, requirement blocks and IDs, terminology, citations, open questions —
are in [`AGENTS.md`](AGENTS.md). They apply to everyone.

## Decision records

Significant design choices are recorded in [`decisions/`](decisions/), so the reasoning is kept alongside the text.
To propose one, copy `decisions/template.md`, give it the next number, set its status to *Proposed*, and open a pull request.
A decision already applied in the document, but not yet reviewed by the working group, has status *Provisional*; these are the priority for group review.

## Working with AI agents

AI agents (for example Claude Code or GitHub Copilot) read `AGENTS.md` automatically.
When you use one:

- review everything it produces as you would a human contributor's work, especially anything about external standards;
- keep its `Co-authored-by:` trailer in commits so its contribution is visible;
- add your own `Signed-off-by:` line — the agent must not add one for you;
- you remain responsible for what you submit.

## Releases and snapshots

A maintainer tags `main` (for example `2026.1`) to publish a dated PDF snapshot.
Snapshots are for citation; the website is always the current version.
