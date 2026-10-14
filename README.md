# agent-say 🎙️

[English](#english) | [日本語](#japanese)

---

<a name="japanese"></a>
## 日本語 🇯🇵

> **AIエージェント（Antigravity、Claude Code、Cursor等）のための超低遅延・耳障りゼロな音声要約通知ツール**

散歩中、移動中、またはTypeless等の音声入力で自律型コーディングエージェントに指示を出しているとき、**「画面読み上げがMarkdownの表記号やURL、コードブロック、ファイルパスを延々と読み上げて鬱陶しい」** と感じたことはありませんか？

`agent-say` は、エージェントが出力したテキストからMarkdown記号やコード、URLなどの「読み上げノイズ」を自動で綺麗に除去し、50〜150文字前後の自然な話し言葉として、**エージェントを一切待たせずバックグラウンドで瞬時に読み上げる**軽量CLIツールです。

### ✨ 特長

- **Markdownノイズの自動除去（サニタイザー）**: URL、コードブロック（` ``` `）、インラインコード（` ` `）、Markdownリンク（`[text](url)`）、見出し記号、太字、ファイルパスを全自動で除去。
- **超低遅延・非同期バックグラウンド実行**: 非同期プロセス（`Popen`）で切り離して実行するため、エージェント側の処理速度に影響を与えません（待機時間0ミリ秒）。
- **骨伝導イヤホン（Shokz等）への自動ルーティング**: Macに `Shokz OpenMove` / `AfterShokz` / Bluetoothイヤホンが接続されていれば、内蔵スピーカーではなく**イヤホン側に優先的に音声をルーティング**（カフェやオフィスで周囲に突然声が鳴り響くのを防ぎます）。
- **高品位ニューラル音声（O-Ren Enhanced / Siri）自動選択**: システム内にインストールされている最も高品位な拡張ニューラル音声（`O-Ren (Enhanced)` > `Otoya (Enhanced)` > `Kyoko (Enhanced)`）を自動検出し、自然な発音で喋ります。
- **依存ライブラリゼロ**: Python 3 標準ライブラリのみで動作。macOS環境ならインストール後即座に使えます。

### 🚀 クイックスタート

#### 1. インストール

```bash
git clone https://github.com/miyatsuko10004/agent-say.git
cd agent-say
./install.sh
```

または手動でシンボリックリンクを作成：
```bash
mkdir -p ~/.local/bin
ln -sf $(pwd)/agent-say ~/.local/bin/agent-say
```

`~/.local/bin` にPATHが通っていることを確認してください（例: `~/.zshrc`）：
```bash
export PATH="$HOME/.local/bin:$PATH"
```

#### 2. 動作確認

```bash
agent-say --test
```

### 📖 使い方

#### CLIでの実行

```bash
# 直接テキストを渡す
agent-say "作業が完了しました。プルリクエストをご確認ください。"

# パイプ（標準入力）経由
echo "レビューが完了しました。修正箇所は2件です。" | agent-say

# 一時的に音声モデルを変更する
agent-say --voice "Otoya (Enhanced)" "オトヤ音声での通知テストです。"
```

#### AIエージェント（Claude Code / Antigravity / Cursor等）への組み込み

お使いのリポジトリの `AGENTS.md`、`.claude/CLAUDE.md`、または Cursor の `Rules for AI` に以下の指示文を追加してください：

```markdown
## 音声要約フィードバックルール（Voice Notification）
タスク完了時またはユーザーへの最終回答時、必ず2〜3文（50〜100文字程度）の簡潔な音声要約を作成し、`agent-say "<要約テキスト>"` をバックグラウンド実行してください。
- 表、Markdown記号、コードブロック、ファイルパスは読み上げないこと。
- 「1) 完了したタスク」「2) 重要な決定事項」「3) 次にユーザーの判断が必要な点」のみを端的に話し言葉で伝えること。
```

### ⚙️ 設定（環境変数・オプション）

| 項目 | デフォルト値 | 説明 |
|---|---|---|
| `AGENT_VOICE` | `O-Ren (Enhanced)` (自動検出) | 読み上げ音声（`O-Ren (Enhanced)`, `Otoya (Enhanced)`, `Kyoko` 等） |
| `AGENT_VOICE_RATE` | `205` | 読み上げ速度（単語数/分） |
| `AGENT_AUDIO_DEVICE` | `OpenMove\|AfterShokz\|Shokz` | 優先出力先デバイスの正規表現 |

#### オプション一覧
- `-v, --voice <name>`: 音声名を指定
- `-l, --list-voices`: 利用可能なシステム音声一覧を表示
- `--test`: テスト音声を再生
- `-h, --help`: ヘルプを表示

---

<a name="english"></a>
## English 🇺🇸

> **Fast, distraction-free voice summary notifications for AI coding agents.**  
> Built for Antigravity (AGY), Claude Code, Cursor, Codex, and multi-agent workflows.

When you're away from your desk, walking, or using voice input (e.g., Typeless) to direct autonomous coding agents, you don't want your screen reader to read through markdown tables, file paths, raw code diffs, or URL hashes.

`agent-say` takes raw text or summaries from AI agents, sanitizes noisy markdown artifacts, limits output to digestible speech length (50–180 chars), and speaks it immediately in the background without blocking the agent.

### ✨ Features

- **Sanitizes Markdown Artifacts**: Strips out URLs, code blocks (` ``` `), inline code (` ` `), markdown links (`[text](url)`), headers, bold markers, and file paths.
- **Ultra-Low Latency & Non-blocking**: Uses detached background processes (`Popen`). Does not block agent execution or wait for speech to finish.
- **Bone Conduction / Headphone Targeting**: Automatically detects and binds audio output to your **Shokz OpenMove / AfterShokz / Bluetooth earphones** so sound doesn't blast out of your MacBook speakers in public.
- **Automatic High-Quality Neural Voice Detection**: Automatically detects installed Apple Enhanced Neural voices (`O-Ren (Enhanced)` > `Otoya (Enhanced)` > `Kyoko (Enhanced)`).
- **Zero Heavy Dependencies**: Pure Python 3 standard library script. Works out-of-the-box on macOS.

### 🚀 Quick Start

#### 1. Installation

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

#### 2. Verify

```bash
agent-say --test
```

### 📖 Usage

#### CLI

```bash
# Direct argument
agent-say "Task completed. Please review the pull request."

# Via Pipe / Stdin
echo "Review completed. Two issues were found." | agent-say

# Voice override
agent-say --voice "Otoya (Enhanced)" "Testing custom voice output."
```

#### AI Agent Integration (Claude Code / Antigravity / Cursor)

Add the following rule to your `AGENTS.md`, `.claude/CLAUDE.md`, or Custom Instructions:

```markdown
## Voice Notification Rule
When completing a task or presenting a final response to the user, run `agent-say "<2-3 concise summary sentences>"` in the background.
- Keep the summary short (50-100 characters in conversational tone).
- Do not include markdown, code blocks, or file paths in the voice argument.
- State only: 1) What was completed, 2) Key decisions made, 3) What the user needs to decide next.
```

### ⚙️ Configuration (Environment Variables & Flags)

| Variable | Default | Description |
|---|---|---|
| `AGENT_VOICE` | `O-Ren (Enhanced)` (auto) | macOS speech voice |
| `AGENT_VOICE_RATE` | `205` | Speech rate in words per minute |
| `AGENT_AUDIO_DEVICE` | `OpenMove\|AfterShokz\|Shokz` | Regex pattern to match audio output device |

---

## 📄 License

MIT License. See [LICENSE](LICENSE) for details.
