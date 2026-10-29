# Yifan Guo — academic homepage

An English academic homepage built from [MarcusYF/academic-homepage-template](https://github.com/MarcusYF/academic-homepage-template), retaining its Hugo/HugoBlox layouts and teal visual style.

Target URL: **https://yifan2003.github.io/**  
Target repository: **https://github.com/yifan2003/yifan2003.github.io** (default branch: `master`).

## Preview and build

The optional toolchain is installed locally in `.tools/`; it is excluded from Git. Nothing is installed globally.

```sh
./scripts/site.sh serve        # http://localhost:1313, live reload
./scripts/site.sh build        # public/ plus the Pagefind search index
./scripts/site.sh versions
```

To preview the complete production build, including search:

```sh
python3 -m http.server 1313 --bind 127.0.0.1 --directory public
```

If the production preview is already using port 1313, use `./scripts/site.sh serve --port 1314` for live editing.

On another Apple Silicon Mac, `./scripts/setup-local.sh` downloads checksum-verified Hugo extended 0.157.0, Go 1.27.3, Node 22.23.4 and pnpm 10.14.0, and installs the pinned Node dependencies. On other platforms, install Hugo extended 0.157.0, Go, Node 22 and pnpm 10.14.0, then run `./scripts/site.sh install`. The locked Hugo modules and Node packages are recorded in `go.mod`, `go.sum` and `pnpm-lock.yaml`.

## Edit content

| Content | File |
| --- | --- |
| Bio, affiliations, email, interests | `data/authors/me.yaml` |
| Homepage sections, education, teaching, honors | `content/_index.md` |
| Papers and BibTeX | `content/publications/<paper>/index.md` and `cite.bib` |
| Navigation | `config/_default/menus.yaml` |
| Page title, description, theme | `config/_default/params.yaml` |
| Site URL | `config/_default/hugo.yaml` |
| Portrait | `assets/media/authors/me.jpg` |
| Downloadable CV | `static/uploads/Yifan_Guo_CV.pdf` |
| Social preview | `assets/media/sharing.png` |

The public CV is maintained in the separate local source `CV/Yifan_Guo_CV_public.tex`; the original CV remains unchanged. Compile the public source into a temporary output directory and copy the resulting PDF to `static/uploads/Yifan_Guo_CV.pdf`. The current feature-highlighting manuscript is an exact copy of the approved `HumanAI/MS.pdf`, served from `static/papers/feature-highlighting/MS.pdf`.

See [content sources](docs/CONTENT_SOURCES.md) and the [original template guide](docs/TEMPLATE_README.md).

## Publish to the existing GitHub Pages address

GitHub Pages builds and publishes this Hugo site from `master` using GitHub Actions.

Preserve repository history when updating the site. In the repository's **Settings → Pages**, use **Source: GitHub Actions**. The supplied deployment workflow targets `master` and publishes to the repository's existing Pages URL. No custom domain or DNS change is needed. Do not upload `.tools/`, `.qa/`, `node_modules/`, `public/`, or local research source directories.

## Credits

Template snapshot: `5a89b9b363a0da847669c4d0f7b3764bc2afc9b8` from MarcusYF/academic-homepage-template. Template code and HugoBlox are MIT licensed; see `LICENSE.md`. The upstream template guide is retained under `docs/`. The site's content uses a plain copyright notice; no additional Creative Commons license has been selected.
