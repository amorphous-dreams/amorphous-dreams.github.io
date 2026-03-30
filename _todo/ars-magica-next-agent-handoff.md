# Ars Magica Next-Agent Handoff

## Current State

- Main site repo now exposes the Ars Magica vault at `/vault/Ars-Magica/`.
- Content repo lives in the `vault/Ars-Magica` submodule and tracks `joshuafontany/Ars-Magica`.
- Pilot set is aligned to the local PDFs currently present in `~/Ars-Magica/_books/`:
  - `ars-magica-5th-edition-standard-core-rulebook.pdf`
  - `realms-of-power-magic.pdf`
  - `realms-of-power-faerie.pdf`
- `catalog.yml` uses normalized slug-based `source_pdf` names.
- The current ingest script only creates extraction stubs in `work/`; it does not yet run real PDF extraction or generate chapter bodies.
- Canonical errata pages exist for the three pilot books, but they are curated summaries of the official Atlas errata, not full structured imports.

## First Tasks

1. Replace the stub logic in `Ars-Magica/scripts/ingest_openars.py` with real extraction using `pdftotext` and `pdfinfo`.
2. Add a normalization pass for page headers, footers, page numbers, ligature damage, and wrapped/hyphenated lines.
3. Implement chapter segmentation for the three pilot books.
4. Generate chapter markdown into the existing book/chapter layout instead of leaving placeholder content.

## Ingestion Requirements

- Use `~/Ars-Magica/_books/<slug>.pdf` as the source of truth.
- Keep raw extraction artifacts in `~/Ars-Magica/work/` and out of git.
- Preserve explicit `permalink` values on generated pages.
- Keep errata separate from canonical chapter text.
- Prefer deterministic output so rerunning ingestion only changes content when the source PDF or generator logic changes.

## Errata Follow-Up

- Convert the current summarized errata pages into structured sections by page number and heading.
- For the core rulebook, confirm whether the local PDF should be treated as first printing only or whether second-printing corrections should also be merged into the errata presentation.
- Add source attribution blocks on errata pages that cite the exact Atlas errata source URL used.
- Audit the generated site output to ensure deleted pilot pages are no longer rendered after a clean build.

## Site Follow-Up

- Rebuild the site from a clean output directory and verify:
  - `/vault/Ars-Magica/` shows only the current pilot set
  - old `Lion & the Lily` and `Hedge Magic Revised Edition` routes are gone if they are meant to be removed
  - operator-nav grouping matches `core_rulebooks`, `realms_of_power`, `errata`, and `legal`
- Consider teaching the nexus page to read `catalog.yml` data directly rather than inferring all cards from `site.pages`.

## Recommended Order

1. Implement real extraction in the content repo.
2. Generate pilot chapter bodies for the three local PDFs.
3. Refine errata pages into structured canonical references.
4. Run a clean Jekyll build in the site repo.
5. Verify routes, then expand the catalog to the next batch of owned PDFs.
