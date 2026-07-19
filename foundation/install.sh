#!/bin/sh
# Install (or refresh) the foundation package AND switch the framework on.
# Foundation is standalone, but it owns the bootstrap: this script places the
# project-root AGENTS.md that makes agent/rules/ get read at session start.
# Run from the root of the consuming project.
set -e

prefix="agent/rules/foundation"
repo="https://github.com/eventide-project/agent-norms-foundation.git"

# 1. Install (or refresh) the foundation rules.
if [ ! -d "$prefix" ]; then
  git subtree add --prefix "$prefix" "$repo" master --squash
fi
git subtree pull --prefix "$prefix" "$repo" master --squash

# 2. Ensure the project-root AGENTS.md switches the framework on (non-clobbering).
if [ -f AGENTS.md ] && grep -q 'agent/rules/' AGENTS.md; then
  echo "AGENTS.md already points at agent/rules/ — left unchanged."
else
  [ -f AGENTS.md ] && printf '\n' >> AGENTS.md   # separate from existing content
  cat >> AGENTS.md <<'EOF'
## Agent Norms

This project's working conventions live under `agent/`, committed alongside the
code and read at the start of each session.

**Read every file in `agent/rules/` at the start of a session and follow them.**
They override default behavior where they conflict; explicit user instructions
still win. The framework itself is defined by the `foundation` package's rules
(`agent/rules/foundation/`) — read those first.
EOF
  echo "Wrote the Agent Norms bootstrap to AGENTS.md."
fi
