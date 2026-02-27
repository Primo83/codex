#!/usr/bin/env bash
set -euo pipefail

branch="main"
push_enabled=1
allow_dirty=0

usage() {
  cat <<'USAGE'
Usage: sync_fork_upstream.sh [--branch <name>] [--no-push] [--allow-dirty]

Options:
  --branch <name>   Branch to sync (default: main)
  --no-push         Do not push to origin
  --allow-dirty     Skip clean working tree check
  -h, --help        Show this help
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --branch)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for --branch" >&2
        exit 2
      fi
      branch="$2"
      shift 2
      ;;
    --no-push)
      push_enabled=0
      shift
      ;;
    --allow-dirty)
      allow_dirty=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository." >&2
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "Missing git remote: origin" >&2
  exit 1
fi

if ! git remote get-url upstream >/dev/null 2>&1; then
  echo "Missing git remote: upstream" >&2
  exit 1
fi

if [[ "$allow_dirty" -ne 1 ]] && [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree is not clean. Commit/stash first or pass --allow-dirty." >&2
  exit 1
fi

echo "==> Fetching remotes"
git fetch --all --prune

echo "==> Switching to $branch"
git checkout "$branch"

echo "==> Merging upstream/$branch into $branch"
git merge --no-edit "upstream/$branch"

if [[ "$push_enabled" -eq 1 ]]; then
  echo "==> Pushing $branch to origin"
  git push origin "$branch"

  echo "==> Pulling latest from origin/$branch to local"
  git pull --ff-only origin "$branch"
else
  echo "==> Skipping push (requested --no-push)"
fi

origin_counts="$(git rev-list --left-right --count "$branch...origin/$branch")"
upstream_counts="$(git rev-list --left-right --count "$branch...upstream/$branch")"

echo "==> Verification"
echo "$branch...origin/$branch: $origin_counts"
echo "$branch...upstream/$branch: $upstream_counts"
