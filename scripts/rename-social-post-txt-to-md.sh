#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
posts_dir="$repo_root/social-post"

while IFS= read -r source; do
  target="${source%.txt}.md"
  if [[ -e "$target" ]]; then
    printf 'Target already exists: %s\n' "$target" >&2
    exit 1
  fi
done < <(find "$posts_dir" -type f -name '*.txt' -print)

while IFS= read -r source; do
  mv "$source" "${source%.txt}.md"
done < <(find "$posts_dir" -type f -name '*.txt' -print)

perl -pi -e 's/\{年-月-日\}\.txt/\{年-月-日\}.md/g; s/2026-06-20\.txt/2026-06-20.md/g' \
  "$repo_root/.ai-global/skills/social-post/SKILL.md"

perl -pi -e 's/social-post\/2026-07-11\.txt/social-post\/2026-07-11.md/g' \
  "$repo_root/scripts/update-social-post-2026-07-11.sh"

perl -pi -e 's/social-post\/2026-07-25\.txt/social-post\/2026-07-25.md/g' \
  "$repo_root/scripts/update-social-post-2026-07-25.sh"
