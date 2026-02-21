## Final Plan: Operator Navigation for Vault Books

We will add an “operator nav” surface to book pages under /vault that lets readers jump to the current Nexus (index) and other books within that same Nexus. The default UX will be a sticky sidebar on desktop plus a floating button that opens a modal panel on mobile. The nav’s content will be derived from a Nexus definition list in _data/nav.yml so it is predictable and editable, while also leveraging existing SDM patterns to avoid breaking current behavior.

Guiding principles for this implementation:
- Use semantic site navigation patterns (`nav`, list-based links), not ARIA menu roles.
- Ensure one clear “current page” marker with `aria-current="page"`.
- Prefer native modal behavior on mobile (`<dialog>` with `showModal()`), or equivalent focus/inert handling if fallback markup is used.
- Respect reduced-motion preferences and avoid motion-heavy transitions.

Scope boundaries for this release:
- In scope: vault book-page operator navigation, shared header/operator context logic, accessibility + reduced-motion support.
- Out of scope: redesign of top-level site header IA, new content taxonomy beyond `vault_nexus`, and non-vault navigation overhauls.

**Implementation TODO (live)**
- [x] Finalize plan + context contract
- [x] Implement `vault_nexus` data model in `_data/nav.yml`
- [x] Create `_includes/vault_nav_context.html` shared context include
- [x] Integrate `_includes/gruv_adapter_header.html` with shared context
- [x] Implement operator nav include + book layout integration
- [x] Add mobile panel JS behavior
- [x] Add styling + reduced-motion rules
- [x] Add desktop collapsed group nodes with full Nexus links when expanded
- [x] Run `make build`
- [x] Complete manual verification checklist

**Steps**
1. Define a Nexus data model in [_data/nav.yml](_data/nav.yml) that can represent each Nexus root under /vault and its available books; include label, root href, and book items (label + href). Keep current `vault_nodes` for the vault index, and add a new `vault_nexus` structure for operator nav.
2. Create a shared navigation-context include (for example `_includes/vault_nav_context.html`) that computes current Nexus, parent href/label, and current book identity from URL/frontmatter. Use this context in both the existing header include and the new operator-nav include so parent/book logic has a single source of truth.
3. Add a reusable include, for example `vault-operator-nav.html`, that:
   - Determines the current Nexus from the request URL or a page frontmatter override.
   - Renders a list of “Nexus” + sibling books for the current Nexus.
   - Marks the current book as active using `aria-current="page"` on a single link.
   - Uses semantic elements (`aside`, `nav`, `ul`) and explicit nav labeling.
   Link the include from the book layout at [_layouts/gruv_book_page_adapter.html](_layouts/gruv_book_page_adapter.html).
4. Implement desktop sticky sidebar styling and mobile floating button + panel styles in [assets/theme-overrides.css](assets/theme-overrides.css).
   - Desktop: `position: sticky` within the content container, with clear hierarchy and a compact list.
   - Desktop guardrails: provide a non-auto `top` offset, constrain nav height (`max-height` + overflow), and avoid ancestor overflow/transform traps that break sticky behavior.
   - Mobile: fixed “operator” button that opens a modal panel/drawer with close affordance and backdrop.
   - Motion: add `@media (prefers-reduced-motion: reduce)` styles that reduce or remove non-essential panel animation.
5. Add minimal JS for the mobile toggle in the existing footer include [ _includes/gruv_adapter_footer.html](_includes/gruv_adapter_footer.html) or a new include; keep it small and scoped to the operator nav.
   - Maintain trigger state (`aria-expanded`, `aria-controls`).
   - Manage focus lifecycle: move focus into panel on open and return focus to trigger on close.
   - Support keyboard close via `Escape` and explicit close button.
   - If not using native modal `<dialog>`, set non-panel content inert while open and remove inert on close.
6. Update [_includes/gruv_adapter_header.html](_includes/gruv_adapter_header.html) to consume the shared context include so existing parent-link behavior is preserved while reducing duplicated path logic; keep layout compatibility in [_layouts/gruv_default_adapter.html](_layouts/gruv_default_adapter.html).

**Verification**
- Build and serve: `make build`, `make serve`.
- Manual checks:
   - Header + operator parity: on vault book pages, header parent link and operator nav Nexus/book context resolve consistently from the shared context include.
  - On a vault book page: sidebar shows Nexus + sibling books, current book highlighted.
  - Mobile width: floating button opens/closes panel; links work; focus is trapped/contained while modal is open.
  - Accessibility: nav landmark is announced distinctly, one link has `aria-current="page"`, and keyboard-only navigation works (Tab/Shift+Tab, Enter/Space, Escape).
  - Motion: reduced-motion mode minimizes or disables panel transition effects.
  - Non‑vault pages: no operator nav rendered.

**Exit Criteria (Definition of Done)**
- Shared nav context include is the single source of truth for header + operator nav on vault routes.
- Existing SDM parent-link behavior remains intact with no regressions on non-vault pages.
- Operator nav is rendered only when `show_operator_nav` is true and never throws Liquid errors on missing data.
- Mobile panel behavior is keyboard-accessible, closable, and focus-safe.
- Exactly one operator-nav link has `aria-current="page"` when a current page can be resolved.
- `make build` completes successfully.

**Decisions**
- Data source: add a new `vault_nexus` structure in _data/nav.yml instead of scraping pages, to keep book lists explicit and stable.
- UX: implement both sticky sidebar (desktop) and floating button + modal panel (mobile) as the initial release.
- Semantics: use disclosure/navigation semantics for expandable sections if needed; do not use ARIA menu roles for site navigation.
- Integration strategy: preserve existing `gruv_adapter_header` as a global quick-parent surface and merge logic via a shared nav-context include consumed by both header and operator nav.

**Context Fields Contract (for `_includes/vault_nav_context.html`)**

Purpose: expose a single normalized context object for both header and operator nav rendering.

**Input Sources (precedence order)**
1. Page frontmatter overrides (highest priority)
2. URL/path inference from `page.url`
3. Data fallback from `_data/nav.yml`

Recommended frontmatter overrides:
- `header_nav_context`
- `vault_nexus_key`
- `vault_parent_href`
- `vault_parent_label`
- `vault_book_key`

**Normalized Output Fields**
- `is_vault_page` (boolean): true for `/vault/**` routes.
- `is_vault_book_page` (boolean): true for leaf/content pages where operator nav should render.
- `nexus_key` (string|null): canonical key into `site.data.nav.vault_nexus`.
- `nexus_label` (string|null): display label for current Nexus.
- `nexus_href` (string|null): canonical Nexus index URL.
- `parent_href` (string|null): header parent target (usually same as `nexus_href`, overrideable).
- `parent_label` (string|null): header parent label (for example, `SDM Nexus`).
- `book_key` (string|null): canonical key for current book/page within current Nexus.
- `book_href` (string|null): canonical href for current book.
- `book_label` (string|null): display label for current book.
- `sibling_books` (array): normalized list for operator nav rendering, each item includes:
   - `key`
   - `label`
   - `href`
   - `is_current` (derived from `book_key` or URL match)
- `show_operator_nav` (boolean): rendering gate for operator nav include.

**Derivation Rules**
- `nexus_key` resolution:
   - Use `page.vault_nexus_key` if set.
   - Else infer from URL prefix matching configured `vault_nexus[*].href`.
- `book_key` resolution:
   - Use `page.vault_book_key` if set.
   - Else infer by exact URL match against current Nexus `books[*].href`.
- `parent_href`/`parent_label` resolution:
   - Use explicit page overrides first.
   - Else use current Nexus values.
   - Else preserve legacy SDM fallback behavior currently in header include.
- `show_operator_nav` should be true only when:
   - `is_vault_book_page == true`, and
   - a valid `nexus_key` with at least one `sibling_books` entry exists.

**Behavioral Guarantees**
- Header and operator nav must read from the same normalized fields.
- Exactly one rendered link in operator nav should have `aria-current="page"`.
- Missing/invalid `nexus_key` must degrade gracefully:
   - header still renders existing global links,
   - operator nav is not rendered,
   - no Liquid error path.

**Execution Order (recommended PR slices)**
1. Data model + context include (`_data/nav.yml`, `_includes/vault_nav_context.html`).
2. Header integration to shared context (`_includes/gruv_adapter_header.html`).
3. Operator nav include + desktop rendering (`_includes/vault-operator-nav.html`, `_layouts/gruv_book_page_adapter.html`).
4. Mobile panel behavior + JS wiring (`_includes/gruv_adapter_footer.html` and related include hooks).
5. Styling polish + reduced-motion rules (`assets/theme-overrides.css`).
6. Verification pass and parity checks.
