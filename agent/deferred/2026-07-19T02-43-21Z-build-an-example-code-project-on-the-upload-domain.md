# Build an example code project on the Upload domain

The `Upload` domain already exists as the neutral example inside the `testing` and `code/ruby` rules — `Upload` (a useful object: dependency, `build` factory, `call` actuator) and its value object `Upload::Result` (with the `Success` / `Rejected` family). Today it lives only as **scattered illustrations inside rule text**. Turn it into a real, coherent **example code project** that demonstrates the Agent Norms end to end — a project a newcomer can read to see the conventions applied together rather than rule-by-rule.

**Likely shape (to settle when picked up):**
- A small buildable Ruby project centered on the `Upload` domain, following the `code/ruby` style and the `testing` conventions (controls, "Is" naming, context nesting, etc.).
- Its own `agent/` tree exercising the foundation/DBE/docs conventions — rules installed via subtree, plus example `plans/`, `design/`, and maybe an `experiments/` record, so the artifact conventions are shown in use, not just described.
- Serves double duty as a live proving ground for the packages (a real consumer, not just the throwaway pull-proofs).

**Open questions (decide before authoring):**
- Scope — a minimal illustrative project, or a fuller worked example with design → plan → implementation → experiment shown in sequence?
- Home — its own repo (e.g. `agent-norms-example-upload`) versus a directory in the composite; standalone consumer vs. part of the norms distribution.
- Whether the scattered in-rule `Upload` snippets should then point at the example project as the canonical source.

**Gated on:** not blocking any in-flight work; deferred as a future initiative. Independent of the parked `constant` work.

**Why:** the norms are currently taught rule-by-rule; a single coherent example project would show how they compose, and would give the packages a real consumer that surfaces integration gaps the isolated pull-proofs can't.

**How to apply:** when picked up, settle the scope and home questions above, then build the `Upload` project test-first under the conventions, install the relevant packages into its `agent/` tree, and decide whether the in-rule snippets should reference it. Related: the `code/ruby` and `testing` rules that already use the `Upload` domain, and the agent-plans / agent-design / agent-experiments conventions the project would exercise.
