# Agent Norms — Handoff / Resume Note

Resume point for continuing this work in a fresh session. Read this first, then the two companion docs in this folder:

- `2026-07-13-agent-norms-packaging-design.md` — the full design (package types, dependency graph, subtree/composite repo workflow, settled decisions).
- `2026-07-13-agent-norms-classification-table.md` — every source rule pinned to a package, with merges and `local/` flagged.

Source rules live in the `constant` repo under `agent/rules/` (a separate mounted folder).

## Working norm (important)

**Do not execute Phase B without an explicit go-ahead.** Present a plan and wait for Scott's unambiguous affirmation before creating or re-splitting any component repo, or pushing. A settled design decision is *not* permission to execute. Authoring in the composite repo (Phase A) is the ongoing work; distribution (Phase B) is gated.

## The goal

Turn `constant`'s `agent/rules/` directives into reusable, general-purpose packages other projects install via `git subtree`, consolidating overlaps, kept live.

## Settled decisions

- **Package = unit of reuse.** Projects depend on whole packages; consolidate *within* a package.
- **Composite repo authoring + split distribution.** This "Agent Norms" folder is the canonical composite repo (packages as root-level dirs, own full history). Each `agent-norms-<package>` component repo is a regenerated one-package view via `git subtree split --prefix=<package>`, pushed to its own repo in `eventide-project`. Sync is one-directional (composite → component).
- **Repo prefix:** `agent-norms-` (e.g. `agent-norms-testing`). `code/` flattens to `code-` in repo names; the subtree prefix keeps the real path `agent/rules/code/ruby`. `code/` groups by *programming* language and is not a package.
- **Package types:** `foundation`, `language`, `design-by-efferent` (DBE), `testing`, `code/ruby`, `git`, `docs` (plus `eventide`, reserved). `code/` and `local/` are grouping namespaces, not packages.
- **Dependencies:** everything → `foundation`; `testing` & `code/ruby` → `language`; `design-by-efferent` → `foundation`, `language`, `testing`. `git`, `docs` standalone.
- **`local/` mirror** holds `constant`-specific rules, never subtree'd, mirrors package categories (`local/code/ruby`, `local/language`, `local/testing`). Stays in `constant` only.
- **Term artifacts per package:** one rule per substitute (no `substitutes.md` table). A cohesive glossary of interlocking terms-with-meanings may be a `vocabulary.md` (DBE is the one package that has one); a standalone term-with-meaning is a rule (e.g. `language`'s `solubility`). Terms placed by the domain they serve.
- **No manifest format;** each package dir carries an `include: …` line in a `package.md` file (separate from the informative `README.md`). A package's structural files — `package.md`, `README.md`, `vocabulary.md` — are exempt from the ISO-8601 filename prefix; its dated artifacts (rules, `log/` entries) always take it.
- **Each package's `log/` carries only rule-content decisions** (consumer provenance; distributed with the package). **Migration/packaging/authoring history is undistributed** — it stays in the composite repo's top-level `agent/log/` (never split/pushed). Distinct from the *project* decision log (foundation's `agent/log/` convention for a consuming project's own decisions). A package log starts empty.

## Consolidations (during migration)

- **M1** controls trio → one rule (`testing`) — done, published.
- **M2** hinge-presentation trio → one rule, `what-each-hinge-displays` (DBE) — done, not yet published.
- **M3** ~~substitutes tables~~ → one rule per substitute (no table); DBE keeps its `vocabulary.md` glossary — done.
- **M4** stale supersessions closed out (mediates-for → mediates; hinge-choices → present-every-prompt; efferent/actuation-not-caller → DBE `vocabulary.md`; error tests named "Fails"/"Doesn't fail" as of 2026-07-17, the `assert_raises`-into-"Is" fold reversed).

## Status

**Phase A (authoring) is complete for all seven packages.** Every package exists as a root-level directory with its rules, `package.md`, `README.md`, and (where applicable) `log/`. Working tree is clean on `master`.

**Phase B (distribution) — six of seven previously published, but five now carry unpublished changes.**

| Package | Published to component repo? | Re-publish needed? |
|---|---|---|
| `docs` | yes | no — untouched since |
| `git` | yes | **yes** — obsolete-path trim |
| `foundation` | yes | **yes** — `vocabulary.md` prefix exemption; obsolete paths; retired `no-slang-mediates` name |
| `language` (was `vocabulary`) | yes, as `agent-norms-vocabulary` | **yes** — renamed; `solubility`, `say-obsolete-not-dead`, and `language-is-precise-here` added; obsolete paths. **Component repo must be renamed `agent-norms-language`.** |
| `testing` | yes | **yes** — verified-not-green carve-out; observe-not-assert; DBE relabels; arrange/obsolete-path conformance |
| `code/ruby` | yes | **yes** — two "dead" → precise-word conformances |
| `design-by-efferent` | **no** | **first publish** — create `agent-norms-design-by-efferent` |

So Phase B is: re-split/push five packages, rename one component repo (`agent-norms-vocabulary` → `agent-norms-language`), and create + push `agent-norms-design-by-efferent`. `docs` needs nothing.

## What this session did (2026-07-17)

Built the DBE package (Phase A), then a cascade of conformance work it exposed:

- **DBE package authored** — the methodology rules relocated with the TDD→DBE genus relabeling, the M2 merge, the M4 folds, the `tdd-lexicon` consolidated as the DBE `vocabulary.md`, the `loops/` contribution, and hinge 2 renamed **assertion → observation**.
- **`vocabulary` package renamed to `language`** — a vocabulary is a set of words; the package governs how language is *used*. Frees "vocabulary" for the glossary artifact (DBE's). Its governing premise, `language-is-precise-here`, was authored: precision is the **extant term**, obscured from two sides — **colloquialism** that buries the established technical term (what the substitutions recover), and **dramatic jargon** that buries meaning under ceremony.
- **`say-obsolete-not-dead` added** to `language` — never "dead" for something no longer used/inactive/obsolete; "obsolete" is the fallback, the exact word (unresolvable / retired / never fires) preferred.
- **solubility (b) enacted** — `solubility` added to `language` as a rule; `name-literally`'s dangling cross-repo reference repointed.
- **Systemic conformance sweep** — see the pattern below.

## The pattern to watch

Every re-publish in the queue traces to one of two recurring faults, and both will keep surfacing:

1. **A package contradicts a rule it includes.** A rule added after the prose it governs, with the prose never conformed. This session found four: green-on-arrival vs. verified-not-green (kept as a deliberate exception), "arrange" vs. controls-not-arrange, "swept" vs. conform-not-sweep, "dead" vs. the new obsolete-not-dead. Each surfaced one at a time, downstream of the word — itself an instance of `language-is-precise-here`.
2. **Obsolete `constant`-layout paths.** The path-trim pass had only ever run on `code/ruby`; `testing`, `language`, `foundation`, and `git` all still carried `agent/rules/…` paths that resolve nowhere for a consumer. Now swept across every package. **Rule settled:** cross-references *by name* are informational pointers and are kept across packages in both directions; only *paths* go obsolete.

Before Phase B, worth one deliberate pass per package asking "does this contradict a rule it includes?" rather than waiting for the next one to surface.

## Open, not blocking

- **`Constant` examples** remain in the relocated `testing` and `code/ruby` rules, deferred to a later generalization pass (noted in their publish logs).
- The `constant` repo's own deferred item `conform-efferent-oriented-design-to-dbe` still covers `constant`'s observations, design docs, and README — not closed by the package work here.

## Next steps

1. Optional pre-Phase-B pass: check each package for the two faults above.
2. **Phase B (gated):** re-split/push `git`, `foundation`, `language`, `testing`, `code/ruby`; rename the `vocabulary` component repo to `language`; create + push `agent-norms-design-by-efferent`. Prove each pull.
3. Update the classification table and packaging design where they still lag the built state (both were conformed for the rename this session, but predate the DBE build's detail).
