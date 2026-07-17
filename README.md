# Agent Norms

Reusable agent directives — the rules an AI coding agent reads at the start of a
session — organized into installable **packages**. A package is the unit of
reuse: a project adopts whole packages, never individual rules.

## Packages

- **foundation** — the `agent/` artifact framework: the
  `rules`/`observations`/`deferred`/`log` directories and how to work with them,
  the one-line decision-log format, and the ISO-8601-UTC filename convention.
  Everything includes it.
- **vocabulary** — cross-cutting phrasing discipline: name concepts literally,
  no slang, and the shared substitutes table.
- **design-by-efferent** — the human-in-the-loop, efferent-first design method
  (DBE): hinges and gates, the actuation-first cycle, and the method's own
  vocabulary. Contributes the `loops/` artifact directory.
- **testing** — controls-based test-writing conventions: variable prefixes, test
  structure and naming, assertion form.
- **code/ruby** — prescriptive Ruby style.
- **git** — commit conventions.
- **docs** — documentation conventions for design docs and implementation plans.

Each package declares its dependencies in a `package.md` file with an `include:`
line. Including a package pulls in the packages it includes.

```
foundation ──► (everything)

vocabulary ──► testing
vocabulary ──► code/ruby
vocabulary, testing ──► design-by-efferent

git   (standalone)
docs  (standalone)
```

## Two kinds of repository

**This monorepo is where all authoring happens.** It holds every package as a
top-level directory under one shared history. Add or refine a rule here. Because
the packages live together, a change spanning several packages is one atomic
commit, and the whole rule set can be read, grepped, and consolidated in one
place. This is the source of truth.

**Each package also has its own repository** — `agent-norms-foundation`,
`agent-norms-testing`, `agent-norms-git`, and so on (the `code/` namespace
flattens to `code-` in the repo name). Each holds a single package's files at its
root. These are how a consuming project installs a package.

The package repositories are **generated from this monorepo, not edited
directly.** Publishing a package is a `git subtree split` that extracts one
package's slice of the monorepo history and pushes it to that package's
repository. Sync runs one way only: monorepo → package repositories.

## Working as a contributor

Author in the monorepo. You never edit a package repository directly. A release
re-splits the changed packages out to their repositories and pushes them — the
split is deterministic, so unchanged history keeps its commits and only new work
is added.

A refinement discovered while working inside a consuming project is promoted back
into the monorepo and re-published outward, so the rules stay live without the
package repositories ever becoming independent sources.

## Using a package in a project

A consuming project installs a package with `git subtree`, which places the
package's files physically into the project's `agent/rules/` tree so they are
committed alongside the code and read at session start:

```
git subtree add  --prefix agent/rules/testing agent-norms-testing main --squash
git subtree pull --prefix agent/rules/testing agent-norms-testing main --squash
```

Consult a package's `package.md` for the packages it includes, and add those too.

## Project-local rules

Rules specific to a single project live under a `local/` directory that mirrors
the package categories (`local/vocabulary`, `local/testing`, `local/code/ruby`)
and is never split or pushed, so a project-specific rule cannot leak upstream.
