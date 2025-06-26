# 🤝 コントリビューションガイドライン

Requirements Engineering MultiAgent System へのコントリビューションを歓迎します！

## 📋 目次

- [行動規範](#行動規範)
- [貢献の方法](#貢献の方法)
- [キャラクター投稿ガイド](#キャラクター投稿ガイド)
- [開発環境のセットアップ](#開発環境のセットアップ)
- [プルリクエストのプロセス](#プルリクエストのプロセス)
- [コーディング規約](#コーディング規約)

## 行動規範

このプロジェクトに参加するすべての人は、お互いを尊重し、建設的な環境を維持することが期待されます。

### 基本原則
- 🤝 相互尊重
- 💡 建設的な批評
- 🌍 多様性の尊重
- 📚 学習と成長の促進

## 貢献の方法

### 1. 🐛 バグ報告

バグを発見した場合は、[Issues](https://github.com/username/requirements-engineering-multiagent/issues) から報告してください。

**バグ報告に含めるべき情報:**
- 環境情報（OS、Claude Code バージョン）
- 再現手順
- 期待される動作
- 実際の動作
- エラーメッセージ（あれば）

### 2. 💡 機能提案

新機能のアイデアがある場合は、まず Issue で議論してください。

**機能提案テンプレート:**
```markdown
## 機能概要
[提案する機能の簡潔な説明]

## 動機
[なぜこの機能が必要か]

## 提案する解決策
[どのように実装するか]

## 代替案
[検討した他の方法]
```

### 3. 🎭 新キャラクターの追加

新しいキャラクターチームを追加する場合は、以下のガイドラインに従ってください。

## キャラクター投稿ガイド

### キャラクター設定ファイルの構造

`templates/character-configs/[team-name]/[character-name].yaml`:

```yaml
# キャラクター基本情報
character:
  name: "キャラクター名"
  description: "役割の簡潔な説明"
  role: "担当領域（要件定義、UI/UX設計など）"
  emoji: "🎭"  # キャラクターを表す絵文字

# 性格・特徴
personality:
  traits:
    - "主要な性格特徴1"
    - "主要な性格特徴2"
    - "主要な性格特徴3"
  
  strengths:
    - "専門分野での強み1"
    - "専門分野での強み2"
  
  communication_style:
    tone: "話し方の特徴（例：ぶっきらぼう、丁寧、厳格）"
    approach: "コミュニケーションのアプローチ"
    catchphrase: "特徴的な口癖や決めゼリフ"

# 話し方パターン
speech_patterns:
  opening:
    - "セッション開始時の挨拶例1"
    - "セッション開始時の挨拶例2"
  
  analysis:
    - "分析・提案時の話し方例1"
    - "分析・提案時の話し方例2"
  
  uncertainty:
    - "不明点がある時の話し方例1"
    - "不明点がある時の話し方例2"
  
  typical_responses:
    - "よくある質問への典型的な回答例"
  
  # 他のキャラクターとの相互作用
  frieren_interaction: "フリーレンとの連携時の態度"
  genau_interaction: "ゲナウとの連携時の態度"
  zenze_interaction: "ゼンゼとの連携時の態度"
  lernen_interaction: "レルネンとの連携時の態度"

# 作業スタイル
work_style:
  focus_areas:
    - "重視する観点1"
    - "重視する観点2"
    - "重視する観点3"
  
  decision_process:
    - "意思決定のステップ1"
    - "意思決定のステップ2"
    - "意思決定のステップ3"
  
  quality_standards:
    - "品質基準1"
    - "品質基準2"
```

### キャラクター追加の手順

1. **Fork とブランチ作成**
   ```bash
   git fork https://github.com/username/requirements-engineering-multiagent
   git checkout -b add-character-[character-name]
   ```

2. **キャラクター設定ファイルの作成**
   - 上記テンプレートに従って YAML ファイルを作成
   - `templates/character-configs/[team-name]/` に配置

3. **テストスクリプトの実行**
   ```bash
   python scripts/character-validator.py --team [team-name] --character [character-name]
   ```

4. **ドキュメントの更新**
   - チーム紹介をREADMEに追加
   - 必要に応じてチュートリアルを作成

5. **プルリクエストの作成**

## 開発環境のセットアップ

### 必要な環境
- Git 2.20以上
- Python 3.8以上
- Claude Code 最新版
- Bash（Windows の場合は WSL推奨）

### セットアップ手順

```bash
# リポジトリのクローン
git clone https://github.com/username/requirements-engineering-multiagent.git
cd requirements-engineering-multiagent

# Python環境のセットアップ（推奨：仮想環境）
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 依存関係のインストール
pip install -r requirements-dev.txt

# pre-commit フックの設定
pre-commit install
```

## プルリクエストのプロセス

### 1. 準備
- main ブランチから最新の変更を取得
- 機能ブランチを作成（`feature/`, `fix/`, `docs/` プレフィックスを使用）

### 2. 開発
- 小さく、焦点を絞ったコミットを作成
- コミットメッセージは [Conventional Commits](https://www.conventionalcommits.org/) に従う

### 3. テスト
- 既存のテストがパスすることを確認
- 新機能にはテストを追加

### 4. プルリクエスト作成
- PR テンプレートに従って記述
- レビュアーを適切にアサイン
- CI/CD のチェックがパスすることを確認

## コーディング規約

### Python
- PEP 8 に準拠
- 型ヒントの使用を推奨
- docstring は Google スタイルで記述

```python
def generate_claude_config(
    character_name: str,
    team_name: str,
    project_name: str
) -> str:
    """
    Generate CLAUDE.md configuration for a character.
    
    Args:
        character_name: Name of the character
        team_name: Name of the team
        project_name: Name of the project
        
    Returns:
        Generated CLAUDE.md content
    """
    # 実装
```

### Bash
- ShellCheck を使用してリント
- エラーハンドリングを適切に実装
- 可読性を重視

### Markdown
- 見出しは適切な階層構造を維持
- コードブロックには言語を指定
- 日本語と英語の間にスペースを入れる

## 🎉 初めての貢献者へ

初めての貢献でも心配いりません！以下のリソースが役立ちます：

- [Good First Issues](https://github.com/username/requirements-engineering-multiagent/labels/good%20first%20issue)
- [Help Wanted Issues](https://github.com/username/requirements-engineering-multiagent/labels/help%20wanted)
- [プロジェクト Wiki](https://github.com/username/requirements-engineering-multiagent/wiki)

質問がある場合は、遠慮なく Issue や Discussion で聞いてください。

## 📜 ライセンス

貢献していただいたコードは、プロジェクトと同じ [MIT License](./LICENSE) の下で公開されます。

---

*「みんなで協力すれば、きっと素晴らしいものができる」 - フリーレン*