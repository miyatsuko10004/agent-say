# agent-say 🎙️

> **Fast, distraction-free voice summary notifications for AI coding agents.**  
> Built for Antigravity (AGY), Claude Code, Cursor, Codex, and multi-agent workflows.

When you're away from your desk, walking, or using voice input (e.g., Typeless) to direct autonomous coding agents, you don't want your screen reader to read through markdown tables, file paths, raw code diffs, or URL hashes.

`agent-say` takes raw text or summaries from AI agents, sanitizes noisy markdown artifacts, limits output to digestible speech length (50–180 chars), and speaks it immediately in the background without blocking the agent.

---

## ✨ Features

- **Sanitizes Markdown Artifacts**: Strips out URLs, code blocks (` ``` `), inline code (` ` `), markdown links (`[text](url)`), headers, bold markers, and file paths.
- **Ultra-Low Latency & Non-blocking**: Uses detached background processes (`Popen`). Does not block agent execution or wait for speech to finish.
- **Bone Conduction / Headphone Targeting**: Automatically detects and binds audio output to your **Shokz OpenMove / AfterShokz / Bluetooth earphones** so sound doesn't blast out of your MacBook speakers in public.
- **Zero Heavy Dependencies**: Pure Python 3 standard library script. Works out-of-the-box on macOS.

---

## 🚀 Quick Start

### 1. Installation

```bash
git clone https://github.com/miyatsuko10004/agent-say.git
cd agent-say
./install.sh
```

Or manually link to `~/.local/bin`:

```bash
mkdir -p ~/.local/bin
ln -sf $(pwd)/agent-say ~/.local/bin/agent-say
```

Ensure `~/.local/bin` is in your `PATH` (e.g. in `~/.zshrc`):
```bash
export PATH="$HOME/.local/bin:$PATH"
```

### 2. Verify

```bash
agent-say --test
```

---

## 📖 Usage

### CLI

```bash
# Direct argument
agent-say "作業が完了しました。プルリクエストをご確認ください。"

# Via Pipe / Stdin
echo "レビューが完了しました。修正箇所は2件です。" | agent-say
```

### AI Agent Integration (Claude Code / Antigravity / Cursor)

Add the following rule to your `AGENTS.md`, `.claude/CLAUDE.md`, or Custom Instructions:

```markdown
## Voice Notification Rule
When completing a task or presenting a final response to the user, run `agent-say "<2-3 concise summary sentences>"` in the background.
- Keep the summary short (50-100 characters in conversational tone).
- Do not include markdown, code blocks, or file paths in the voice argument.
- State only: 1) What was completed, 2) Key decisions made, 3) What the user needs to decide next.
```

---

## ⚙️ Configuration (Environment Variables)

| Variable | Default | Description |
|---|---|---|
| `AGENT_VOICE` | `Kyoko` | macOS speech voice (e.g., `Kyoko`, `Otoya`, `Siri`) |
| `AGENT_VOICE_RATE` | `210` | Speech rate in words per minute (higher = faster) |
| `AGENT_AUDIO_DEVICE` | `OpenMove\|AfterShokz\|Shokz` | Regex pattern to match audio output device |

Example:
```bash
export AGENT_VOICE="Kyoko"
export AGENT_VOICE_RATE="220"
export AGENT_AUDIO_DEVICE="AirPods|OpenMove"
```

---

## 🗺️ Roadmap & Next Generation TTS

- [x] macOS Native TTS (`say`) with auto-routing
- [ ] Fish Audio API / Local integration
- [ ] Apple NeuralTTS / Siri-enhanced voice bindings
- [ ] Style-Bert-VITS2 local backend support
- [ ] OpenAI TTS (`tts-1`) fallback

---

## 📄 License

MIT License. See [LICENSE](LICENSE) for details.
