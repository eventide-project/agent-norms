# Foundation must ship the bootstrap that activates the framework (root `AGENTS.md`)

Installing the packages via `git subtree` puts rule files under `agent/rules/foundation/`, `agent/rules/testing/`, etc. — but **nothing establishes the session-start behavior that reads them**. The whole framework depends on "read every file in `agent/rules/` at the start of a session and follow them," and that trigger cannot live inside `agent/rules/`: a rule there can't bootstrap the reading of its own directory. It must come from a **root-level `AGENTS.md`** (or `CLAUDE.md`) that the harness auto-loads.

So a fresh project that installs the packages **still won't load the rules** until a root bootstrap file is added. The packages provide the rules and the *description* of the framework (foundation's `agent-rules-convention` even states the read-and-follow instruction) — but not the one file that activates the framework.

**Confirmed:** `constant`'s root `AGENTS.md` carries the line verbatim ("Read every file in `agent/rules/` at the start of a session and follow them"). Foundation's convention rules were *extracted from* that `AGENTS.md` prose, but the bootstrap pointer stayed at the root, because it has to.

**Done (Phase A):** `foundation/install.sh` is written and tested — it `subtree`-adds/refreshes foundation, then places the root `AGENTS.md` bootstrap. Behavior:
- **No `AGENTS.md`** → creates it (non-destructive, no prompt).
- **Existing `AGENTS.md` without the bootstrap** → **prompts the user for permission before appending**, first **explaining the effect** (the agent will read every file in `agent/rules/` at session start and follow it; those rules override defaults where they conflict; explicit user instructions still win; existing content is kept, the section added at the end) and **showing the exact text** to be appended. Appends only on a `y`/`yes`; leaves the file unchanged otherwise. Refuses to modify when not running interactively (`[ -t 0 ]`), printing the section for a manual paste.
- **Already bootstrapped** (`grep 'agent/rules/'`) → left unchanged (idempotent).

The bootstrap text is a self-contained heredoc *in the script*, so the earlier `foundation/AGENTS.md.template` was **retired** — the script is the single source, nothing to drift against.

**Settled:** a **single root `AGENTS.md`** covers everything — it is loaded both by the `agents.md` standard and by **Claude Code** (which loads `AGENTS.md` as well as `CLAUDE.md`). No separate `CLAUDE.md` variant, note, or symlink is needed.

**The delivery-mechanism problem — no existing script fits cleanly.** `git subtree` only writes under its prefix (`agent/rules/foundation/`), so the one file that must sit at the project *root* is the one subtree can't place. And the existing scripts map badly onto the job:
- `install-all.sh` (composite-level) installs all seven packages from the project root, so it *could* drop the root `AGENTS.md` as a final step — but it only covers the "install everything" path, and it lives only in the composite repo (the consumer copies it).
- `<package>/install-dependencies.sh` is the wrong layer: only `language` / `testing` / `design-by-efferent` carry one, and it exists to pull a package's *dependencies*, not to bootstrap the root.
- A bare `git subtree add --prefix agent/rules/foundation …` runs **no script at all**.

The crux: **`foundation` owns the bootstrap, but `foundation` is standalone and by convention carries no install script** — so the package responsible for activation has no per-package hook to place it.

**Recommendation:** give **`foundation` its own install script** (e.g. `foundation/install.sh`), breaking the "standalone packages carry no script" convention *deliberately*, because placing the root bootstrap is foundation's responsibility, not a dependency step. That script — `git subtree add` foundation, then create-or-append the root `AGENTS.md` — becomes the single canonical way to install the framework's base, and it directly covers the common "install foundation" path. `install-all.sh` then calls it (or repeats the root step) so the all-in path is covered too; the bare manual `subtree add` path is documented as needing the root file.

**Done (2026-07-19):**
- **`install-all.sh` integration.** `foundation/install.sh` gained an `agents-md` mode (places the root `AGENTS.md` only, skipping the subtree add). `install-all.sh` installs every package and then calls `sh agent/rules/foundation/install.sh agents-md`, so the bootstrap logic lives in **one** place — no duplication, no drift.
- **README documented.** `foundation/README.md` now leads with `sh install.sh`, explains that the root `AGENTS.md` is what activates the framework and why `git subtree` can't place it, and notes the manual-`subtree`-then-add-the-root-file path.

**Still open (remaining work):**
- **Publish `foundation`** so `install.sh` reaches the component repo. Part of the first Waytide release — see [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]. Gated.

**Gated on:** the composite-side work is done; only the publish remains, folded into the first Waytide release (gated on go-ahead and the license).

**Why:** without the bootstrap, the packages are inert in a new project — installing them changes nothing until the root file exists. This is the one piece the distribution currently omits, and it's the piece that makes everything else run.

**How to apply:** `foundation/install.sh` is written (Phase A). To finish: wire `install-all.sh` to cover the root step, document the manual `subtree add` path (and the new `install.sh`) in foundation's README, then re-publish `foundation` (Phase B, gated). Related: foundation's `agent-rules-convention` (states the read-and-follow instruction the bootstrap enables), `install-all.sh` and the per-package `install-dependencies.sh` scripts (the existing install vehicles this extends), `foundation/install.sh` (the written script), and the packaging design's session-start assumption.
