# amorphous-dreams.github.io

Amorphous Dreams Cabal Pages - A Jekyll GitHub Pages site for hosting collaborative storytelling content.

## Structure

This repository is the Jekyll GitHub Pages layer that hosts content from other repositories as submodules. The `/vault` path serves as the root for all book pages.

### Directory Structure

```
.
├── _config.yml          # Jekyll configuration
├── _layouts/            # Page templates
├── _includes/           # Reusable components
├── _data/               # Data files (navigation, etc.)
├── assets/              # CSS, images, etc.
├── vault/               # Content root (submodules go here)
├── index.md             # Home page
└── .gitmodules          # Git submodules configuration
```

## Adding Content Submodules

To add a new content repository as a submodule:

```bash
git submodule add <repository-url> vault/<folder-name>
git commit -m "Add <name> submodule"
```

## Local Development

```bash
# Install dependencies
bundle install

# Run local server
bundle exec jekyll serve

# Visit http://localhost:4000
```

## Deployment

The site automatically deploys to GitHub Pages via GitHub Actions when changes are pushed to the `main` branch.

## Reference

This setup is inspired by the structure from [Synthetic-Dream-Machine](https://github.com/joshuafontany/Synthetic-Dream-Machine).

