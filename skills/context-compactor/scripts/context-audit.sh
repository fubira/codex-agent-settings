#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:-.}"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
KNOWLEDGE_DIR="/mnt/c/Users/matsushita/obsidian/notes/RESOURCES/AI_KNOWLEDGE"

total_lines=0
total_chars=0

measure_file() {
  local label="$1"
  local path="$2"
  if [[ -f "$path" ]]; then
    local lines chars
    lines=$(wc -l < "$path")
    chars=$(wc -c < "$path")
    printf "  %-44s %5d lines  %7d chars\n" "$label" "$lines" "$chars"
    total_lines=$((total_lines + lines))
    total_chars=$((total_chars + chars))
  else
    printf "  %-44s %s\n" "$label" "(not found)"
  fi
}

measure_tree() {
  local label="$1"
  local path="$2"
  if [[ -d "$path" ]]; then
    local files chars
    files=$(find "$path" -type f -name '*.md' 2>/dev/null | wc -l)
    chars=$(find "$path" -type f -name '*.md' -exec cat {} + 2>/dev/null | wc -c)
    printf "  %-44s %5d files  %7d chars\n" "$label" "$files" "$chars"
  else
    printf "  %-44s %s\n" "$label" "(not found)"
  fi
}

echo "=== Codex Context Audit ==="
echo ""

echo "[Instructions]"
measure_file "Global ($CODEX_HOME/AGENTS.md)" "$CODEX_HOME/AGENTS.md"
project_agents="$PROJECT_DIR/AGENTS.md"
global_real=$(realpath "$CODEX_HOME/AGENTS.md" 2>/dev/null || true)
project_real=$(realpath "$project_agents" 2>/dev/null || true)
if [[ -n "$project_real" && "$project_real" != "$global_real" ]]; then
  measure_file "Project (AGENTS.md)" "$project_agents"
fi
echo ""

echo "[Skills]"
if [[ -d "$CODEX_HOME/skills" ]]; then
  while IFS= read -r skill_file; do
    skill_name=$(basename "$(dirname "$skill_file")")
    measure_file "$skill_name" "$skill_file"
  done < <(find "$CODEX_HOME/skills" -mindepth 2 -maxdepth 3 -name SKILL.md | sort)
fi
echo ""

echo "[Memory-like files]"
measure_tree "Codex memories" "$CODEX_HOME/memories"
echo ""

echo "[Knowledge] (referenced on demand)"
measure_tree "Obsidian AI_KNOWLEDGE" "$KNOWLEDGE_DIR"
echo ""

echo "=== Summary ==="
printf "  Auto-loaded estimate: %d lines / %d chars (~%d tokens)\n" "$total_lines" "$total_chars" "$((total_chars / 4))"
echo "  Token estimate: chars / 4"
