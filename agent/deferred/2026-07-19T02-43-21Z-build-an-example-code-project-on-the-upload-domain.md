# Build an example code project on the Upload domain

The `Upload` domain used throughout the `testing` and `code/ruby` rules — `Upload` (a useful object: dependency, `build` factory, `call` actuator) and its value object `Upload::Result` (with the `Success` / `Rejected` family) — is **not** invented for the rules. It comes from an existing example project:

- **Source project:** `dependencies-and-substitutes` — local at `/Users/sbellware/projects/eventide/dependencies-and-substitutes`, hosted at <https://github.com/eventide-examples/dependencies-and-substitutes> (the `eventide-examples` org). The `Upload` class appears as an evolving `demos/*.rb` series (dependency / substitute / mimic concepts). The in-rule snippets were drawn from it.

So a real project already carries the `Upload` domain; today it lives there as **demos**, and inside the norms only as **scattered rule illustrations**. The idea here is a coherent **example code project** that demonstrates the Agent Norms end to end — either by extending `dependencies-and-substitutes` (or a project built from its `Upload` domain) with the norms' `agent/` conventions in use, so a newcomer sees the conventions applied together rather than rule-by-rule.

**Likely shape (to settle when picked up):**
- A small buildable Ruby project centered on the `Upload` domain, following the `code/ruby` style and the `testing` conventions (controls, "Is" naming, context nesting, etc.).
- Its own `agent/` tree exercising the foundation/DBE/docs conventions — rules installed via subtree, plus example `plans/`, `design/`, and maybe an `experiments/` record, so the artifact conventions are shown in use, not just described.
- Serves double duty as a live proving ground for the packages (a real consumer, not just the throwaway pull-proofs).

**Open questions (decide before authoring):**
- Relationship to `dependencies-and-substitutes` — extend that existing project with the norms' `agent/` conventions in place, or stand up a fresh example project built from its `Upload` domain? (The existing repo is in the `eventide-examples` org, not `eventide-project` where the norms live.)
- Scope — a minimal illustrative project, or a fuller worked example with design → plan → implementation → experiment shown in sequence?
- Whether the scattered in-rule `Upload` snippets should then point at the example project as the canonical source of the domain.

**Gated on:** not blocking any in-flight work; deferred as a future initiative. Independent of the parked `constant` work.

**Why:** the norms are currently taught rule-by-rule; a single coherent example project would show how they compose, and would give the packages a real consumer that surfaces integration gaps the isolated pull-proofs can't.

**How to apply:** when picked up, start from `dependencies-and-substitutes` (read its `demos/` `Upload` series), settle the relationship and scope questions above, then build/extend the `Upload` project test-first under the conventions, install the relevant packages into its `agent/` tree, and decide whether the in-rule snippets should reference it. Related: the source project `dependencies-and-substitutes` (`eventide-examples` org), the `code/ruby` and `testing` rules that already use the `Upload` domain, and the agent-plans / agent-design / agent-experiments conventions the project would exercise.
