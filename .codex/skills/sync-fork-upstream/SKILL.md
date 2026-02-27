---
name: sync-fork-upstream
description: Synchronize a forked repository with upstream/main, push to origin/main, and verify parity. Use when the user asks to pull latest changes from the original repo and align local fork state.
---

# Sync Fork Upstream

Use this skill when a repository has both `origin` (fork) and `upstream` (original repo), and the user asks to "pull from original", "align fork", or "bring local up to date".

## Workflow

1. Safety checks:
- Confirm current directory is a git repo.
- Confirm remotes `origin` and `upstream` exist.
- Default to a clean working tree; if dirty, stop and ask user.

2. Sync:
- `git fetch --all --prune`
- `git checkout main`
- `git merge --no-edit upstream/main`
- `git push origin main`
- `git pull --ff-only origin main` (final local refresh from origin after push)

3. Verify:
- `git rev-list --left-right --count main...origin/main` should be `0 0`.
- `git rev-list --left-right --count main...upstream/main` should have `0` on the right side (nothing missing from upstream).

4. Report:
- Provide concise status with counts and merge result.
- Mention consequence if local has extra commits ahead of upstream (normal for fork custom history).

## Preferred Command

```bash
bash .codex/skills/sync-fork-upstream/scripts/sync_fork_upstream.sh
```

## Optional Flags

- Dry run without push:

```bash
bash .codex/skills/sync-fork-upstream/scripts/sync_fork_upstream.sh --no-push
```

- Change target branch:

```bash
bash .codex/skills/sync-fork-upstream/scripts/sync_fork_upstream.sh --branch release
```
