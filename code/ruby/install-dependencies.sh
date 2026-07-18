#!/bin/sh
# Install the agent-norms packages this package depends on.
# Run from the root of the consuming project.
set -e

add() {
  prefix="agent/rules/$1"
  repo="https://github.com/eventide-project/agent-norms-$1.git"
  if [ -d "$prefix" ]; then
    echo "$prefix already present — skipping"
  else
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi
}

add foundation
add language
