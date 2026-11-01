# Oséias D. de Farias: research website

Source of [oseiasdfarias.github.io/research](https://oseiasdfarias.github.io/research/), built with [al-folio](https://github.com/alshedivat/al-folio) (MIT).

## Where to edit

- Publications: `_bibliography/papers.bib`
- Home page: `_pages/about.md` and `_pages/pt/about.md`
- Research areas: `_projects/` and `_projects/pt/`
- CV: `_data/cv.yml` and `_data/cv_pt.yml`
- Social links: `_data/socials.yml`

English pages live at the root and Portuguese pages under `/pt/`, using [jekyll-polyglot](https://github.com/untra/polyglot). A page and its translation share the same `permalink`.

## Local overrides

- `_includes/header.liquid`: copy of the `al_folio_core` 1.0.15 header with one addition, the language switch. Compare it with the gem when upgrading.
- `_plugins/localized_site.rb`: per-language configuration, CV data, and labels the gems hard-code in English.

## Publishing

Pushing to `develop` builds the site and publishes it to the `gh-pages` branch.

After a local build, `bin/check-site.sh` checks for leftover template content and missing pages.
