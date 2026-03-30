---
name: statusline-setup
description: Install or update the Claude Code statusline. Shows current directory, git branch, active model, context window %, rate limit usage, and Spotify now playing (macOS). Invoke when setting up Claude Code for the first time or adding the statusline to a new machine.
user-invocable: true
allowed-tools: Read, Write, Edit, Bash(chmod:*), Bash(cat:*), Bash(ls:*)
---

# Statusline Setup

This skill installs a Claude Code statusline that shows:
- 📁 Current directory
- 🌿 Git branch (when inside a repo)
- 🤖 Active model name
- 📊 Context window usage % (turns red at 80%)
- 💰 5-hour rate limit usage %
- ♫ Spotify now playing (macOS only, when a track is playing)

## What I'll do

1. Copy `statusline.sh` from `${CLAUDE_SKILL_DIR}` to `~/.claude/statusline.sh`
2. Make it executable
3. Read `~/.claude/settings.json` and add the `statusLine` config (preserving existing fields)
4. Confirm everything is wired up

## Steps

### 1. Install the script

Read the script at `${CLAUDE_SKILL_DIR}/statusline.sh` and write it to `~/.claude/statusline.sh`, then run:

```
chmod +x ~/.claude/statusline.sh
```

### 2. Update settings.json

Read `~/.claude/settings.json`. If it doesn't exist, create it. Add or update the `statusLine` field:

```json
{
  "statusLine": {
    "type": "command",
    "command": "sh ~/.claude/statusline.sh"
  }
}
```

Preserve all existing fields — only add/update `statusLine`.

### 3. Confirm

Tell the user:
- Where the script was installed
- That the statusline will appear on the next Claude Code interaction
- macOS note: Spotify integration requires granting Terminal Automation permission for Spotify in System Settings → Privacy & Security → Automation
- Linux/Windows note: the Spotify section will silently show nothing (osascript is macOS-only)
