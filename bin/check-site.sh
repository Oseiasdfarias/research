#!/usr/bin/env bash
# Fails if the built site leaks template sample content or is missing real content.
set -u
SITE="${1:-_site}"
fail=0

for pattern in 'Einstein' 'You R\. Name' 'example\.com' 'example_pdf' 'alshedivat\.github\.io' 'torvalds'; do
  hits=$(grep -rlE "$pattern" "$SITE" --include='*.html' --include='*.xml' --include='*.json' --include='*.js' --exclude-dir=assets 2>/dev/null || true)
  if [ -n "$hits" ]; then
    echo "LEAK [$pattern]:"; echo "$hits" | head -5; fail=1
  fi
done

if find "$SITE" -iname '*.pdf' | grep -q .; then
  echo "PDF found:"; find "$SITE" -iname '*.pdf'; fail=1
fi

for page in index.html publications/index.html areas/index.html repositories/index.html cv/index.html; do
  for root in "$SITE" "$SITE/pt"; do
    [ -f "$root/$page" ] || { echo "MISSING: $root/$page"; fail=1; }
  done
done

for root in "$SITE" "$SITE/pt"; do
  count=$(grep -oE 'id="(defarias|potts|farias)[0-9a-z]+"' "$root/publications/index.html" 2>/dev/null | sort -u | wc -l)
  [ "$count" -eq 6 ] || { echo "PUBLICATIONS in $root: expected 6, got $count"; fail=1; }
  self=$(grep -oE '<em>\s*Oséias' "$root/publications/index.html" 2>/dev/null | wc -l)
  [ "$self" -eq 6 ] || { echo "AUTHOR HIGHLIGHT in $root: expected 6, got $self"; fail=1; }
done

[ "$fail" -eq 0 ] && echo "check-site: OK"
exit "$fail"
