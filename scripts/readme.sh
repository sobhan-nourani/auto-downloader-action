#!/bin/bash
set -e

git config user.name "github-actions"
git config user.email "actions@github.com"

REPO_URL="https://github.com/${GITHUB_REPOSITORY}"

for DIR in output/*; do
  [ -d "$DIR" ] || continue

  ID=$(basename "$DIR")
  README="$DIR/README.md"

  cat > "$README" <<EOF
# 📦 Download Package

✅ Auto Generated
🆔 ID: $ID
🕒 $(date)

## 🔗 Files
EOF

  for f in "$DIR"/*; do
    FILE=$(basename "$f")
    [ "$FILE" = "README.md" ] && continue

    echo "- [$FILE]($REPO_URL/raw/main/output/$ID/$FILE)" >> "$README"
  done
done

