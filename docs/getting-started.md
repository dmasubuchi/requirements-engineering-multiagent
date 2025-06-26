# 🚀 Getting Started - フリーレンチームと始める要件定義

このガイドでは、Requirements Engineering MultiAgent System を使って、フリーレンチームと一緒に要件定義を始める方法を説明します。

## 📋 目次

1. [前提条件](#前提条件)
2. [インストール](#インストール)
3. [最初のプロジェクト作成](#最初のプロジェクト作成)
4. [フリーレンチームとの対話](#フリーレンチームとの対話)
5. [成果物の確認](#成果物の確認)
6. [次のステップ](#次のステップ)

## 前提条件

### 必要なツール
- **Git** 2.20以上
- **Claude Code** 最新版
- **Python** 3.8以上（スクリプト実行用）
- **Bash** （Windows の場合は WSL または Git Bash）

### 確認コマンド
```bash
# Git バージョン確認
git --version

# Python バージョン確認
python --version

# Claude Code 確認
claude --version
```

## インストール

### 1. リポジトリのクローン

```bash
git clone https://github.com/username/requirements-engineering-multiagent.git
cd requirements-engineering-multiagent
```

### 2. ディレクトリ構造の確認

```bash
ls -la
# 以下が表示されるはずです:
# README.md
# LICENSE
# CONTRIBUTING.md
# docs/
# templates/
# examples/
# scripts/
# .github/
```

## 最初のプロジェクト作成

### 1. サンプルプロジェクトへ移動

```bash
cd examples/sample-web-service
```

### 2. セットアップスクリプトの実行

```bash
./setup.sh
```

### 3. 対話的セットアップ

スクリプトが起動すると、以下のような選択画面が表示されます：

```
🎭 Requirements Engineering MultiAgent v2.0 へようこそ

利用可能なキャラクターチーム:
1) 🧙‍♀️ フリーレンチーム（フリーレン、ゲナウ、ゼンゼ、レルネン）
2) 💼 プロフェッショナルチーム（ビジネス向け標準設定）
3) 🎨 カスタムチーム（独自キャラクター設定）

チーム選択 (1-3): 1
```

フリーレンチームを選択（1を入力）すると、チームメンバーの紹介が表示されます：

```
🧙‍♀️ フリーレンチームを選択しました！
  - フリーレン: 要件・設計（ぶっきらぼうだが的確）
  - ゲナウ: UI/UX設計（厳格で妥協なし）
  - ゼンゼ: システム設計（平和的だが確実）
  - レルネン: 文書化（謙虚で完璧主義）

プロジェクト名を入力 (default: my-requirements-project): my-awesome-app
```

### 4. セットアップ完了

```
🎉 フリーレンチーム セットアップ完了！

📂 作成されたディレクトリ:
  🏠 メインプロジェクト: ../my-awesome-app (main ブランチ)
  🎭 フリーレン: ../requirements-lead/ (requirements-lead ブランチ)
  🎭 ゲナウ: ../ui-design/ (ui-design ブランチ)
  🎭 ゼンゼ: ../implementation-support/ (implementation-support ブランチ)
  🎭 レルネン: ../documentation/ (documentation ブランチ)
```

## フリーレンチームとの対話

### 1. メインプロジェクトでフリーレンと開始

```bash
cd ../my-awesome-app
claude
```

フリーレンが最初に話しかけてきます：

```
で、何が欲しいの
```

ここで、あなたのプロジェクトについて説明します。例：

```
ECサイトを作りたいんです。ユーザーが手作りの商品を売買できるマーケットプレイスです。
```

フリーレンの反応：

```
ECサイト。なんで？今あるやつじゃダメなの？

...まあいいや。手作り商品のマーケットプレイスね。
誰が使うの？売る人？買う人？両方？
```

### 2. 他のチームメンバーを起動（別ターミナル）

#### ゲナウ（UI/UX設計）を起動：
```bash
cd ../ui-design
claude
```

ゲナウの挨拶：
```
UI設計を見させてもらう。甘い考えは捨てろ。
フリーレンの要件を確認中...

手作り商品のマーケットプレイスか。
ユーザビリティで妥協は許さない。
```

#### ゼンゼ（システム設計）を起動：
```bash
cd ../implementation-support
claude
```

ゼンゼの挨拶：
```
システム設計について検討させていただきます。
平和的に、しかし確実に進めましょう。

要件を拝見しました。技術的な実現可能性を検証いたします。
```

#### レルネン（文書化）を起動：
```bash
cd ../documentation
claude
```

レルネンの挨拶：
```
皆様の成果を文書化させていただきます。
長年の経験から、適切な形で整理いたしましょう。
```

### 3. チーム協調作業の流れ

1. **フリーレンが要件を収集**
   - ビジネス目的の明確化
   - ユーザーニーズの深掘り
   - 機能要件の整理

2. **ゲナウがUI/UXを設計**
   - 画面フローの作成
   - モックアップの実装
   - ユーザビリティの検証

3. **ゼンゼがシステムを設計**
   - API仕様の作成
   - データベース設計
   - 技術スタックの選定

4. **レルネンが全体を統合**
   - 要件定義書の完成
   - 開発ガイドの作成
   - プロジェクト計画の策定

## 成果物の確認

### 1. 共有ドキュメントの確認

```bash
cd ../my-awesome-app
cat shared/要件定義書.md
```

要件定義書には以下が含まれます：
- プロジェクト基本情報
- ビジネス要件
- ユーザー要件
- システム要件
- 進捗状況

### 2. 各メンバーの成果物

#### フリーレンの成果物：
```bash
ls ../requirements-lead/output/
# business-requirements.md
# user-stories.md
# success-metrics.md
```

#### ゲナウの成果物：
```bash
ls ../ui-design/output/
# wireframes/
# mockups/
# design-system.md
```

#### ゼンゼの成果物：
```bash
ls ../implementation-support/output/
# api-specification.yaml
# database-design.md
# architecture.md
```

#### レルネンの成果物：
```bash
ls ../documentation/output/
# requirements-specification.md
# development-guide.md
# project-timeline.md
```

### 3. Git履歴の確認

```bash
git log --oneline --graph --all
```

各メンバーの作業履歴が可視化されます：
```
* a1b2c3d (documentation) feat(lernen): プロジェクト統合文書作成
* d4e5f6g (implementation-support) feat(zenze): API仕様書完成
* g7h8i9j (ui-design) feat(genau): ログイン画面モックアップ作成
* j1k2l3m (requirements-lead) feat(frieren): ユーザー要件確定
```

## 次のステップ

### 1. 🎯 チュートリアルを読む

より詳細な使い方を学ぶ：
- [初めてのプロジェクト with フリーレン](./tutorials/first-project-with-frieren.md)
- [キャラクター間の連携ガイド](./tutorials/character-interaction-guide.md)

### 2. 💡 ベストプラクティスを確認

効率的な活用方法：
- [フリーレンチーム協調作業](./best-practices/frieren-team-coordination.md)
- [品質の高い要件定義のコツ](./best-practices/quality-requirements.md)

### 3. 🔧 カスタマイズに挑戦

- 独自のキャラクター追加
- プロジェクトテンプレートの拡張
- ワークフローの最適化

### 4. 🤝 コミュニティに参加

- [GitHub Discussions](https://github.com/username/requirements-engineering-multiagent/discussions) で質問
- 成功事例の共有
- 新機能の提案

## よくある質問

### Q: フリーレンが素っ気ない返事しかしません
A: それがフリーレンの個性です。でも、よく聞いてみると的確なアドバイスをしています。

### Q: ゲナウが厳しすぎます
A: ゲナウは品質に妥協しません。でも、その厳しさがより良いUIを生み出します。

### Q: 複数のエージェントをどう管理すればいいですか？
A: ターミナルを4つ開いて、それぞれでエージェントを起動することをお勧めします。または、tmux や screen を使用してセッション管理することも可能です。

### Q: 成果物はどこに保存されますか？
A: 各エージェントの `output/` ディレクトリと、共有の `shared/` ディレクトリに保存されます。

---

*「長い旅の第一歩を踏み出したね。でも、まだまだこれからだよ」 - フリーレン*

次は → [初めてのプロジェクト with フリーレン](./tutorials/first-project-with-frieren.md)