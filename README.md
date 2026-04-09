# claude-deck ♣️

A Claude Code statusline that shows what matters while you work.

```
📁 my-project  🌿 main  🤖 Claude Sonnet 4.6  📊 23% context window  💰 5% usage  📝 LOC: 3847  ♫ Texas Sun – Khruangbin
```

## What it shows

| Element | Description |
|---|---|
| 📁 Directory | Current working directory name |
| 🌿 Git branch | Active branch (hidden outside git repos) |
| 🤖 Model | Active Claude model |
| 📊 Context window | Usage % — turns 🔴 at 80% |
| 💰 Rate limit | 5-hour session usage % |
| 📝 LOC | Lines of code in current project (updated each prompt) |
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

1. Copy the scripts:
   ```sh
   cp statusline.sh ~/.claude/statusline.sh
   cp loc.sh ~/.claude/loc.sh
   chmod +x ~/.claude/statusline.sh ~/.claude/loc.sh
   ```

2. Add to `~/.claude/settings.json`:
   ```json
   {
     "statusLine": {
       "type": "command",
       "command": "sh ~/.claude/statusline.sh"
     },
     "hooks": {
       "UserPromptSubmit": [{
         "hooks": [{
           "type": "command",
           "async": true,
           "command": "cwd=$(jq -r '.cwd // empty'); [ -n \"$cwd\" ] && (cd \"$cwd\" && sh ~/.claude/loc.sh > /tmp/claude-loc 2>/dev/null) || true"
         }]
       }]
     }
   }
   ```

3. Start a new Claude Code session — the statusline appears immediately. LOC updates after your first prompt.

## Requirements

- Claude Code
- `jq` (for JSON parsing) — install via `brew install jq` or your package manager
- `git` (for branch display)
- macOS + Spotify (optional, for now-playing) — requires Automation permission:
  System Settings → Privacy & Security → Automation → grant Terminal access to Spotify

## How the statusline updates

The statusline script runs on each refresh — it reads from a cache file for LOC (non-blocking). LOC is computed by a `UserPromptSubmit` hook that runs `loc.sh` asynchronously in the background each time you send a prompt, so it never slows down the statusline. Spotify is queried inline via AppleScript on each refresh.

## Customization

Edit `~/.claude/statusline.sh` directly. Each section is clearly commented and independent — remove or reorder sections as needed.

## License

MIT
