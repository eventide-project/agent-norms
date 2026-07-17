# Agent Norms — Migration Plan: `vocabulary` package

Execution plan for the third migration increment — the `vocabulary` package: the cross-cutting phrasing discipline that `testing`, `code/ruby`, and `design-by-efferent` all include. Companion to the packaging design and classification table. Same Phase A (local) → Phase B (distribution) shape as before.

**Working norm:** this plan is not permission to execute. Present and wait for explicit go-ahead before creating files or publishing.

## Scope

`vocabulary` is the first package with a real **consolidation** (M3): the scattered "say X not Y" terminology rules collapse into one `substitutes.md` table. It `include: foundation`, and unblocks three downstream packages, so it comes before them.

Its content is *not* method- or test-specific — only phrasing substitutions with no home domain. Domain-specific terms live elsewhere (controls/verified/protect → `testing`; efferent/actuation/hinge → the DBE vocabulary).

## Contents (composite repo)

- **`name-literally-not-by-analogy.md`** — relocated unchanged. The governing principle: name concepts by literal description, no analogies/codes/academic jargon.
- **A no-slang principle rule** — the principle half of the current `terminology-no-slang-mediates` rule (literal, non-slang phrasing, in prose *and* conversation). **Recommendation:** keep it as its own short rule, parallel to `name-literally` (the packaging design names both as principles), with the specific substitutions moved to the table.
- **`substitutes.md`** — NEW (M3). One table consolidating the general phrasing/slang substitutions now spread across separate files:

  | Retired | Use instead | from |
  |---|---|---|
  | happy path | normal path | `normal-path-not-happy-path` |
  | vendor (re-vendor, vendored) | install packages | `say-install-packages-not-vendor` |
  | thread (thread it through) | convey | `say-convey-not-thread` |
  | "initialized with" / "passed to" | sent to | `sent-to-phrasing` |
  | sweep | conform | `terminology-no-slang-mediates` |
  | "does that land?" | plain ("is that right?") | `terminology-no-slang-mediates` |
  | arm (of a method/feature) | scenario | `terminology-no-slang-mediates` |
  | cut (of scope) | increment | `terminology-no-slang-mediates` |

  A shared `**Why:**` (imported jargon/metaphor forces a mapping; the literal term is free at the point of use) plus a per-row note only where a row carries real information.
- **`package.md`** (`include: foundation`) and an informative **`README.md`**.

## Not migrated — stays `constant`-local

Two substitutions are `constant`-domain, not general, so they do **not** enter the composite package — they stay in `constant`, destined for its `local/vocabulary/` mirror:

- **wrap → mediates** — "mediates" is the `Constant`↔module verb. The `terminology-no-slang-mediates` rule therefore **splits**: its general rows go to the composite `substitutes.md` (above); the `mediates` row stays `constant`-local.
- **literal constant** (`literal-constants-terminology`) — entirely `Constant`-domain.

The `local/` mirror lives in `constant`, never in this composite repo and never split/pushed. Reconciling it (pulling the vocabulary package into `constant`, moving these rows to `local/vocabulary/`) is `constant`-side work, done when `constant` adopts the packages — **out of scope for this increment**.

## Where the consolidation is logged

The M3 consolidation is a **migration/authoring** event, so its decision-log entry goes in the composite repo's top-level `agent/log/` (undistributed), not `vocabulary/log/`. `vocabulary/log/` starts empty — per the rule-content-only log principle.

## Phase A — Local

1. Create `vocabulary/` in the composite repo.
2. Relocate `name-literally-not-by-analogy.md` unchanged.
3. Author the no-slang principle rule (principle half of `no-slang-mediates`).
4. Author `substitutes.md` — consolidate the eight general rows above; leave `mediates` and `literal-constant` for `constant`.
5. `package.md` (`include: foundation`) + `README.md`.
6. Commit; add one M3 consolidation entry to the composite `agent/log/`.

## Phase B — Distribution

Create `eventide-project/agent-norms-vocabulary` (public), `git subtree split --prefix=vocabulary`, push to `main`, prove the pull into a throwaway project.

## Open questions

1. **No-slang principle placement** — its own rule (recommended) vs. folded into the `substitutes.md` intro.
2. **`substitutes.md` structure** — one flat table (recommended) vs. grouped; how much per-row rationale to preserve when the source files' `**Why:**` sections collapse.
3. **`sent-to`** — the table pins it here (general), but it is Eventide messaging idiom; confirm it isn't `eventide`-reserved.

## Not done without explicit go-ahead

Any file create, and all of Phase B.
