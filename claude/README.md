# Claude Code session archive

Every Claude Code session on every machine is copied to the Raspberry Pi
(`pfrang@home`), so all chats live in one place and can be continued on another PC.

- `hooks/sync-to-pi.sh` runs when a Claude session ends and copies
  `~/.claude/projects` and `~/.claude/history.jsonl` to the Pi.
- `bin/claude-pull` lists the sessions on the Pi, copies the one you pick to this
  machine and resumes it.

On the Pi, sessions are stored per machine:

```
~/claude-archive/<hostname>/projects/<project-dir>/<session-id>.jsonl
~/claude-archive/<hostname>/history.jsonl
```

## Setup on a new PC (Linux or macOS)

### 0. Join Tailscale and add the `home` ssh alias

The Pi is reached over Tailscale, so the same address works at home and away.

1. Install Tailscale (https://tailscale.com/download) and log in with the same
   account as the Pi. Then check that the Pi is visible:

   ```bash
   tailscale status        # the Pi should be listed as "home"
   ```

2. Add this to `~/.ssh/config` (create the file if it doesn't exist):

   ```
   Host home
     HostName home
     User pfrang
   ```

   `HostName home` uses Tailscale's MagicDNS name for the Pi. If it doesn't resolve,
   use the full name shown by `tailscale status` or in the Tailscale admin console.

### 1. Check that you can reach the Pi

```bash
ssh pfrang@home true
```

This must work **without a password prompt**, because the hook runs unattended. If it
asks for a password, set up a key:

```bash
ssh-keygen -t ed25519          # skip if you already have ~/.ssh/id_ed25519
ssh-copy-id pfrang@home
```

You also need `rsync` on the PC. It comes with macOS and most Linux distros.
The Pi needs `rsync` and `python3`, which Raspberry Pi OS already has.

### 2. Clone the dotfiles

```bash
mkdir -p ~/code
git clone git@github.com:pfrang/pf-dotfiles.git ~/code/pf-dotfiles
```

If you clone it somewhere else, change the paths in the next step.

### 3. Link the scripts into place

```bash
mkdir -p ~/.claude/hooks ~/.local/bin
ln -sf ~/code/pf-dotfiles/claude/hooks/sync-to-pi.sh ~/.claude/hooks/sync-to-pi.sh
ln -sf ~/code/pf-dotfiles/claude/bin/claude-pull ~/.local/bin/claude-pull
```

Because these are symlinks, a `git pull` in the dotfiles updates the scripts.

Check that `~/.local/bin` is on your `PATH`:

```bash
which claude-pull
```

If that prints nothing, add this to `~/.zshrc` and open a new terminal:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

### 4. Add the SessionEnd hook

Open `~/.claude/settings.json` and add the `hooks` block. **Merge it with what is
already there** instead of replacing the file:

```json
{
  "hooks": {
    "SessionEnd": [
      {
        "hooks": [
          { "type": "command", "command": "$HOME/.claude/hooks/sync-to-pi.sh" }
        ]
      }
    ]
  }
}
```

### 5. Test it

```bash
~/.claude/hooks/sync-to-pi.sh </dev/null      # run one sync by hand
ssh pfrang@home ls claude-archive              # this PC's hostname should be listed
claude-pull                                    # should show a table of sessions
```

If you already have a lot of sessions on this PC, the first sync can take a while.
After that, each sync only sends what changed.

## Usage

### Continue a session from another PC

1. Exit Claude on the first PC (`/exit` or Ctrl+D). The hook syncs it to the Pi.
2. Commit and push your code there, then `git pull` on the second PC. The transcript
   moves to the new PC, but your code changes don't.
3. On the second PC, `cd` into the same project and run:

```bash
claude-pull              # pick from a table of recent sessions on all machines
claude-pull <session-id> # or resume a specific session directly
```

`claude-pull` is a **terminal command**, not a slash command. Run it *instead of*
`claude`; it starts Claude for you. Typing `/claude-pull` inside Claude does nothing.

If `fzf` is installed, the picker is searchable; otherwise you get a numbered list.

### Notes

- Run `claude-pull` from the project directory you want Claude to work in. It warns
  you if the folder name differs from where the session originally ran.
- Don't keep the same session open on two PCs at once. The two copies would split
  into different histories.
- `/rewind` can't go back past the move, because Claude's file snapshots stay on the
  original PC.
- The archive on the Pi is never pruned. Claude Code deletes local sessions after 30
  days, but the Pi keeps them.
- Transcripts can contain secrets (file contents, command output). Keep
  `~/claude-archive` on the Pi readable only by you.

## Configuration

`claude-pull` reads these environment variables. Defaults are in brackets.

| Variable                | Default         | Meaning                         |
| ----------------------- | --------------- | ------------------------------- |
| `CLAUDE_ARCHIVE_REMOTE` | `pfrang@home`   | ssh target of the Pi            |
| `CLAUDE_ARCHIVE_DIR`    | `claude-archive`| archive folder on the Pi        |
| `CLAUDE_PULL_LIMIT`     | `30`            | how many sessions to list       |

`sync-to-pi.sh` has its settings at the top of the file. If you change the Pi
address or the archive folder, change them in both scripts.

## Troubleshooting

- **Nothing reaches the Pi:** look at `~/.claude/sync-to-pi.log` on the PC.
  `rsync error ... (code 255)` means the ssh connection failed or was cut off.
- **`claude-pull: could not reach pfrang@home`:** `ssh pfrang@home true` must work
  without a password. Away from home, `home` must still resolve, e.g. via Tailscale.
- **Exiting Claude is slow when away from home:** the hook gives up after a 5-second
  connection timeout. The session syncs the next time the Pi is reachable.
