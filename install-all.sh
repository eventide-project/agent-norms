#!/bin/sh
# Install (or refresh) every agent-norms package into a consuming project.
# Run from the root of the consuming project.
set -e

add() {
  prefix="agent/rules/$1"
  repo="https://github.com/waytide/$2.git"

  if [ ! -d "$prefix" ]; then
    git subtree add --prefix "$prefix" "$repo" master --squash
  fi

  git subtree pull --prefix "$prefix" "$repo" master --squash
}

add foundation          foundation
add language            language
add testing             testing
add code/ruby           code-ruby
add git                 git
add plan                plan
add design-by-efferent  design-by-efferent
