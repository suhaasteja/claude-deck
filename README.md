# claude-statusline

A Claude Code statusline that shows what matters while you work.

```
📁 my-project  🌿 main  🤖 Claude Sonnet 4.6  📊 23% context window  💰 5% usage  ♫ Texas Sun – Khruangbin
```

## What it shows

| Element | Description |
|---|---|
| 📁 Directory | Current working directory name |
| 🌿 Git branch | Active branch (hidden outside git repos) |
| 🤖 Model | Active Claude model |
| 📊 Context window | Usage % — turns 🔴 at 80% |
| 💰 Rate limit | 5-hour session usage % |
| ♫ Now playing | Spotify track + artist (macOS only, when playing) |

## Install

### Option A — via skill (recommended)

1. Copy `SKILL.md` and `statusline.sh` to a skill directory:
   ```sh
   mkdir -p ~/.claude/skills/statusline
   cp SKILL.md ~/.claude/skills/statusline/SKILL.md
   cp statusline.sh ~/.claude/skills/statusline/statusline.sh
   ```
2. In Claude Code, run `/statusline-setup`

### Option B — manual

1. Copy the script:
   ```sh
   cp statusline.sh ~/.claude/statusline.sh
   chmod +x ~/.claude/statusline.sh
   ```

2. Add to `~/.claude/settings.json`:
   ```json
   {
     "statusLine": {
       "type": "command",
       "command": "sh ~/.claude/statusline.sh"
     }
   }
   ```

3. Start a new Claude Code session — the statusline appears immediately.

## Requirements

- Claude Code
- `jq` (for JSON parsing) — install via `brew install jq` or your package manager
- `git` (for branch display)
- macOS + Spotify (optional, for now-playing) — requires Automation permission:
  System Settings → Privacy & Security → Automation → grant Terminal access to Spotify

## How the statusline updates

The script runs every time Claude Code refreshes the statusline (on each interaction). There is no background daemon — it queries Spotify inline via AppleScript on each refresh.

## Customization

Edit `~/.claude/statusline.sh` directly. Each section is clearly commented and independent — remove or reorder sections as needed.

## License

MIT
