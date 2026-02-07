# amorphous-dreams.github.io

Jekyll site layer for Amorphous Dreams content, with submodule-driven books and a vendored theme pipeline.

## Architecture

### Repository Roles

- `vault/`: content submodules (books, chapters, media)
- `_submodules/`: infrastructure submodules (`gruv-poole`, `game-icons`)
- `_vendor/`: generated vendored theme source from `_submodules/gruv-poole`

### Content Model

- Publishable content is markdown in `vault/**`.
- Required frontmatter for published pages:
  - `layout`
  - `title`
  - `published: true`
- Main SDM navigation page: `vault/synthetic-dream-machine.md`

### Layout Model

- Canonical active layouts:
  - `_layouts/gruv_default_adapter.html`
  - `_layouts/gruv_book_page_adapter.html`
  - `_layouts/gruv_vault_index_adapter.html`
- Compatibility aliases:
  - `_layouts/default.html`
  - `_layouts/book_page.html`
  - `_layouts/vault_index.html`

### Style Model

- Base theme source: `_submodules/gruv-poole`
- Vendored sync target: `_vendor/gruv-poole`
- Base theme entrypoint: `assets/theme-gruv-poole.scss`
- Site overrides: `assets/theme-overrides.css`
- Head include order: base first, overrides second (`_includes/gruv_adapter_head.html`)

### Navigation And Data Model

- Navigation source of truth: `_data/nav.yml`
- Header context is selected by URL prefix (`context_map`) or page override (`header_nav_context`)
- SDM navigation is organized as two categories:
  - `Synthetic Dream Machine`: canonical SDM books by Luka Rejec
  - `Amorphous Dreams`: Elyncia and FTLS in-development material

## Development

```bash
# Install dependencies locally
make deps

# Sync vendored gruv-poole theme source
make vendor-gruv-poole

# Build site
make build

# Serve locally
make serve
```

`make build` and `make serve` run `make vendor-gruv-poole` first, so local output matches CI/theme source state.

## Core Dev Workflow

### Typical Update Loop

```bash
# 1) Sync submodules
git submodule update --init --recursive --remote --rebase

# 2) Rebuild vendored theme source
make vendor-gruv-poole

# 3) Verify site build
make build
```

### Content Submodule Changes

```bash
# After upstream content repo moves forward
git submodule update --remote --rebase
git add vault/<submodule-folder>
git commit -m "Update <submodule-folder> submodule"
```

### Infrastructure Submodule Changes

```bash
# Pull latest theme/icon infra
git submodule update --remote --rebase
git add _submodules/gruv-poole _submodules/game-icons
git commit -m "Update infrastructure submodules"
```

### Frontmatter Guardrails

- Published markdown should include:
  - `layout: gruv_book_page_adapter` (or another valid active layout)
  - `title: ...`
  - `published: true`
- SDM library page excludes `_agents` and `_todo` from rendered navigation.

## Submodules

```bash
# Add content submodule
git submodule add <repository-url> vault/<folder-name>

# Add infrastructure submodules
git submodule add https://github.com/joshuafontany/gruv-poole.git _submodules/gruv-poole
git submodule add https://github.com/joshuafontany/game-icons.git _submodules/game-icons

# Refresh all submodules to latest upstream refs
git submodule update --remote --rebase
```

## Troubleshooting

If `bundle install` tries writing to `/var/lib/gems` and fails, use a local bundle path:

```bash
bundle config set path vendor/bundle
bundle install
```

## Deployment

GitHub Actions deploys automatically on push to `main`.
Build pipeline runs:

1. `actions/checkout` with submodules
2. `make vendor-gruv-poole`
3. `bundle exec jekyll build`
