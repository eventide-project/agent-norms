# Flatten the atomic history records before finalizing

Before this work is finalized, a good deal of the **atomic history records** should be flattened. Many one-file-per-decision entries split a single topic across many files, which is confusing to read. (Scott, 2026-07-19.)

## The three tiers (they don't flatten the same way)

1. **Composite `agent/log/` — the migration/authoring history (34 files, UNDISTRIBUTED).** This is the main target. It never ships to consumers, so flattening it is low-risk and doesn't touch the convention consumers adopt. Clear topic-split clusters:
   - the DBE build — six files stamped `…T03-44-3x` (M2 hinge-trio merge, M4 folds, tdd-lexicon→DBE vocabulary, solubility-b, tdd→dbe genus test, vocabulary.md exemption) are one work session;
   - the `vocabulary`/`language` decisions — one-rule-per-substitute, solubility-general, wrap→mediates, obsolete-not-dead, vocabulary→language rename, precision-not-formality;
   - the publishes — five separate `…-package-published` entries plus the Phase B execution;
   - the framework/packaging decisions — include/package.md (adopted then dropped), per-package logs, composite/component naming, ISO-prefix exemptions.
   Fold these into a small set of **topic documents** (or sections in the existing `log/` narrative docs), so the record reads as topics, not a scatter of atoms.

2. **`log/` — the narrative migration docs (11 files).** Already topic-level (packaging design, handoff, classification table, per-package plans, runbook/checklist). Little to flatten; the per-package migration plans (done) could collapse into one "migration record," and the flattened `agent/log/` history could land here.

3. **Per-package `log/` — DISTRIBUTED (testing 3, language 1, design-by-efferent 5).** Handle with care: these ship to consumers and *exemplify* the one-file-per-decision decision-log convention, so consolidating them (a) touches consumers → re-publish, and (b) rubs against the very rule they demonstrate. Only flatten a genuinely confusing topic-split here (candidate: DBE's 5), and weigh it against the convention.

## Tension with the decision-log convention

Foundation's `decision-log-convention` is "one file per decision, a one-line title." Flattening is **retrospective consolidation of *completed* history**, not a change to the go-forward live-log convention — the live convention stays one-file-per-decision. Decide whether to note this explicitly (e.g. "a closed body of migration history may be consolidated into topic records") or keep it a one-off.

## Recommendation

- **Flatten tier 1** (composite `agent/log/` migration history) into topic documents — the high-value, low-risk win. Keep the atomic entries' facts; group by topic.
- **Fold tier 2's done migration plans** into one migration record; place the flattened history alongside.
- **Leave tier 3 (distributed per-package logs) mostly as-is**; flatten only a specific confusing case, accepting the re-publish.
- Keep the live decision-log convention unchanged; optionally add the "closed history may be consolidated" note.

## Open questions

- Scope — tier 1 only, or also tier 3 (distributed)?
- Target structure — new consolidated doc(s) under `log/`, or sections folded into existing narrative docs (handoff / packaging design)?
- Do the flattened-away atomic files get deleted, or kept? (Deleting is the point — the flattened doc is the record.)

**Gated on:** finalizing this work — do before the migration is called done. Not urgent; no distribution impact for tier 1 (undistributed). Tier 3 would need a re-publish (see [[2026-07-19T05-22-32Z-pending-release-republish-all-seven-packages]]).

**Why:** one-file-per-decision is right for a live log, but a large *closed* body of migration decisions read better as a few topic narratives than as dozens of atoms — especially when one topic is split across many files. This is readability of the historical record, for anyone reading the repo.

**How to apply:** when picked up, settle the scope/structure questions, group tier 1's entries by topic, write the consolidated topic document(s), delete the flattened atomic files, and log the consolidation itself. Related: foundation's `decision-log-convention`, the `log/` narrative migration docs, and the handoff.
