# Pending release — re-publish all seven packages (puts-not-lands changes)

All seven packages carry **unpublished changes** and need a Phase B re-publish at the next release. Left unpublished deliberately (2026-07-19, at Scott's direction) — batch it later rather than push now.

**What's pending (commit `a00f76c`, "Say 'puts' not 'lands' for placement throughout"):**
- **Every package README** — the install line changed to "`git subtree` — it puts the files in your project's `agent/rules/` tree…" (all seven: foundation, language, plan, git, testing, code/ruby, design-by-efferent).
- **`foundation` rules** — `agent-deferred-convention` ("is put into code or rules"), `rules-install-a-mindset` and `experiment-runs-on-its-own-branch` ("goes into" / "is just the log copy").
- **`language` rule** — `no-slang` ("goes into the codebase").

**Also pending in `language` (two new rules):** `communicate-plainly-name-the-thing` (speak and write plainly, name the actual thing, no invented labels or unexplained jargon) and `expand-abbreviations-on-first-use` (spell out an abbreviation the first time; no unexplained shorthand). Both are principle rules beneath the `language-is-precise-here` premise; the language README's discipline list gains them (now four disciplines).

**Package renamed: `docs` → `plan`.** The `docs` package was renamed `plan` in the composite (folder, references, README all conformed). At release time the component repo must be renamed and its history reset — the same procedure as the earlier `vocabulary` → `language` rename:
- `gh repo rename agent-norms-plan -R eventide-project/agent-norms-docs` (GitHub-side only)
- `git subtree split --prefix=plan -b publish-tmp` then `git push --force …/agent-norms-plan.git publish-tmp:master`
- The force is expected: the composite path changed (`docs/` → `plan/`), so the split is a new history, not a fast-forward. Safe because there are no real consumers yet (proved only with throwaway pulls).

So the component repos are behind the composite — `foundation` for the phrasing changes (and later the bootstrap `install.sh`), `language` for the phrasing change plus the two new rules, and `plan` for the rename plus the phrasing change.

**How to re-publish:** the path in `log/2026-07-17-agent-norms-phase-b-runbook.md`. Six of the seven are plain **fast-forward** re-publishes (unchanged prefix); **`plan` is the exception** — rename + force-reset, per the block above. Prove each pull. (Note: `foundation` and the former `docs` were last published earlier this session with the new planning/design/experiments conventions; this release carries the phrasing changes on top, plus the `plan` rename.)

**Batch with, if decided by then:** the `foundation` bootstrap `install.sh` (see [[2026-07-19T02-56-52Z-foundation-must-ship-the-bootstrap-that-switches-the-framework-on]]) — it also re-publishes `foundation`, so shipping both at once saves a round.

**Gated on:** explicit go-ahead (every push writes to public component repos). Not blocking — purely a distribution step.

**Why:** the composite is the source of truth and already conformed; the component repos just need the next deterministic re-publish to catch up. Recorded so the pending release survives beyond the session in which the changes were made.

**How to apply:** when releasing, follow the Phase B runbook — fast-forward re-publish for six packages, and the rename + force-reset for `plan` (was `docs`). Prove each pull, log a composite `agent/log/` entry, and update the state-of-the-work note. Delete this item once done.
