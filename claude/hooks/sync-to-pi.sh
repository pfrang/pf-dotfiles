#!/usr/bin/env bash
# Mirror local Claude Code transcripts to the Raspberry Pi archive.
# Run by the SessionEnd hook in ~/.claude/settings.json.
#
# Result on the Pi:
#   ~/claude-archive/<hostname>/projects/<project-dir>/<session-id>.jsonl
#   ~/claude-archive/<hostname>/history.jsonl

HOST="$(hostname -s)"                 # short name, works on Linux and macOS
REMOTE="pfrang@home"
REMOTE_DIR="claude-archive/$HOST"
SSH="ssh -o BatchMode=yes -o ConnectTimeout=5"

cat >/dev/null   # the hook sends session JSON on stdin; not needed here

# No --delete: the Pi keeps sessions even after Claude Code's local cleanup removes them.
rsync -a -e "$SSH" \
  --rsync-path="mkdir -p $REMOTE_DIR && rsync" \
  "$HOME/.claude/projects" "$HOME/.claude/history.jsonl" \
  "$REMOTE:$REMOTE_DIR/" \
  >>"$HOME/.claude/sync-to-pi.log" 2>&1

exit 0   # never block or error the session exit
