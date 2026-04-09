#!/bin/sh
# Count lines of code in a directory (defaults to current dir)
# Excludes generated/dependency directories and non-code files

DIR="${1:-.}"

total=$(find "$DIR" \
  -type d \( \
    -name node_modules -o -name .git -o -name dist -o -name build -o -name out \
    -o -name .output -o -name .next -o -name .nuxt -o -name .svelte-kit \
    -o -name target -o -name vendor -o -name venv -o -name .venv \
    -o -name __pycache__ -o -name .cache -o -name coverage -o -name .nyc_output \
    -o -name .tox -o -name Pods -o -name DerivedData \
  \) -prune \
  -o -type f \( \
    -name "*.js"   -o -name "*.mjs"   -o -name "*.cjs" \
    -o -name "*.ts"   -o -name "*.mts"   -o -name "*.cts" \
    -o -name "*.jsx"  -o -name "*.tsx" \
    -o -name "*.vue"  -o -name "*.svelte" \
    -o -name "*.py"   -o -name "*.pyi" \
    -o -name "*.rb"   -o -name "*.php" \
    -o -name "*.go"   -o -name "*.rs" \
    -o -name "*.c"    -o -name "*.h" \
    -o -name "*.cpp"  -o -name "*.cc"  -o -name "*.cxx" \
    -o -name "*.hpp"  -o -name "*.hh" \
    -o -name "*.java" -o -name "*.kt"  -o -name "*.kts" \
    -o -name "*.swift" -o -name "*.cs" \
    -o -name "*.sh"   -o -name "*.bash" -o -name "*.zsh" \
    -o -name "*.lua" \
    -o -name "*.r"    -o -name "*.R" \
    -o -name "*.css"  -o -name "*.scss" -o -name "*.sass" -o -name "*.less" \
    -o -name "*.html" -o -name "*.htm" \
    -o -name "*.ex"   -o -name "*.exs" \
    -o -name "*.erl"  -o -name "*.hrl" \
    -o -name "*.hs"   -o -name "*.lhs" \
    -o -name "*.ml"   -o -name "*.mli" \
    -o -name "*.clj"  -o -name "*.cljs" \
    -o -name "*.scala" -o -name "*.dart" \
    -o -name "*.zig"  -o -name "*.nim" \
  \) -print \
  | xargs wc -l 2>/dev/null \
  | tail -1 \
  | awk '{print $1}')

echo "${total:-0}"
