// Footer for PDF snapshots. The release workflow overwrites the two values below.
#let snapshot-version = "Unreleased draft"
#let snapshot-date = "not a published snapshot"
#set page(footer: context [
  #set text(size: 8pt, fill: rgb("#7a4a12"))
  Snapshot #snapshot-version (#snapshot-date) — may be out of date.
  Current version: #link("https://nmea-cloud.github.io/Framework/")
  #h(1fr)
  #counter(page).display()
])
