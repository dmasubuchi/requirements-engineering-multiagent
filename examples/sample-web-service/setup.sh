#!/bin/bash
# Requirements Engineering MultiAgent Setup Script v2.0
# フリーレンチーム対応版

set -e

echo "🎭 Requirements Engineering MultiAgent v2.0 へようこそ"
echo ""
echo "利用可能なキャラクターチーム:"
echo "1) 🧙‍♀️ フリーレンチーム（フリーレン、ゲナウ、ゼンゼ、レルネン）"
echo "2) 💼 プロフェッショナルチーム（ビジネス向け標準設定）"
echo "3) 🎨 カスタムチーム（独自キャラクター設定）"
echo ""
read -p "チーム選択 (1-3): " team_choice

case $team_choice in
  1)
    CHARACTER_TEAM="frieren-team"
    echo "🧙‍♀️ フリーレンチームを選択しました！"
    echo "  - フリーレン: 要件・設計（ぶっきらぼうだが的確）"
    echo "  - ゲナウ: UI/UX設計（厳格で妥協なし）"
    echo "  - ゼンゼ: システム設計（平和的だが確実）"
    echo "  - レルネン: 文書化（謙虚で完璧主義）"
    ;;
  2)
    CHARACTER_TEAM="professional-team"
    echo "💼 プロフェッショナルチームを選択しました！"
    ;;
  3)
    CHARACTER_TEAM="custom"
    echo "🎨 カスタムチームを選択しました！"
    echo "※ 高度な設定が必要です。docs/tutorials/custom-characters.md を参照してください"
    ;;
  *)
    echo "❌ 無効な選択です"
    exit 1
    ;;
esac

# プロジェクト名入力
read -p "プロジェクト名を入力 (default: my-requirements-project): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-my-requirements-project}

echo ""
echo "🎯 設定確認:"
echo "  チーム: $CHARACTER_TEAM"
echo "  プロジェクト名: $PROJECT_NAME"
echo ""
read -p "この設定で続行しますか？ (y/N): " confirm

if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "セットアップを中止しました"
    exit 0
fi

PROJECT_DIR="../${PROJECT_NAME}"

# 1. プロジェクトディレクトリ作成＆Git初期化
echo "📁 プロジェクト作成: ${PROJECT_DIR}"
if [ -d "$PROJECT_DIR" ]; then
    echo "❌ エラー: ${PROJECT_DIR} は既に存在します"
    exit 1
fi

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

echo "🔧 Git リポジトリ初期化..."
git init -b main

# 2. テンプレートファイル配置
echo "📋 プロジェクトテンプレート配置..."
cp -r ../sample-web-service/project-template/* .
mkdir -p shared .claude

# プロジェクト名をREADMEに反映
if [ -f "README.template.md" ]; then
    sed "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" README.template.md > README.md
    sed "s/{{CHARACTER_TEAM}}/${CHARACTER_TEAM}/g" README.md > README.tmp && mv README.tmp README.md
    rm README.template.md
fi

# 3. 共有ファイル初期化（フリーレンチーム対応）
echo "📄 共有ファイル初期化..."

cat > shared/参照資料.md << 'EOF'
# 参照資料

## プロジェクト概要
<!-- プロジェクトの背景、目的、参考情報をここに記載 -->
<!-- フリーレンチーム全員がこの情報を参照します -->

## 参考サイト・サービス
<!-- 競合サービスや参考にしたいサイトのリンク -->
<!-- ゲナウがUI設計時に特に参照します -->

## 技術的参考資料  
<!-- 技術選定の参考資料やドキュメント -->
<!-- ゼンゼが技術設計時に活用します -->

## ステークホルダー情報
<!-- 関係者の情報や連絡先 -->
<!-- レルネンが文書化時に整理します -->

---
*このファイルはフリーレンチーム全員が参照・更新します*
EOF

cat > shared/要件定義書.md << EOF
# ${PROJECT_NAME} 要件定義書

## プロジェクト基本情報
- **プロジェクト名**: ${PROJECT_NAME}
- **担当チーム**: フリーレンチーム
- **開始日**: $(date +%Y-%m-%d)
- **想定期間**: 
- **予算**: 

## フリーレンチーム役割分担
- **🧙‍♀️ フリーレン**: 要件収集・設計リード
- **⚔️ ゲナウ**: UI/UX設計・品質管理
- **🛡️ ゼンゼ**: システム設計・技術検証
- **📜 レルネン**: 文書化・統合管理

## ビジネス要件
### 目的・目標
<!-- フリーレンが人間との対話で明確化 -->

### 成功指標
<!-- どうなったら成功か -->

## ユーザー要件
### ターゲットユーザー
<!-- ゲナウがUI設計で重視する情報 -->

### ユーザーストーリー
<!-- フリーレンが構造化、ゲナウがUI化 -->

## システム要件
### 機能要件
<!-- フリーレンが定義、ゼンゼが技術検証 -->

### 非機能要件
<!-- ゼンゼが技術的実現可能性を評価 -->

## 進捗状況
- [ ] 初期要件収集（フリーレン担当）
- [ ] UI/UX設計（ゲナウ担当）
- [ ] 技術設計（ゼンゼ担当）  
- [ ] 文書統合（レルネン担当）

---
*この文書はフリーレンチームが協力して完成させます*
EOF

# 4. Claude設定（フリーレンチーム対応）
echo "🤖 Claude Code設定作成..."

cat > .claude/settings.local.json << EOF
{
  "project_name": "${PROJECT_NAME}",
  "character_team": "${CHARACTER_TEAM}",
  "multiagent_mode": true,
  "team_info": {
    "name": "フリーレンチーム",
    "description": "一級魔法使いによる高品質要件定義チーム",
    "members": {
      "frieren": "要件・設計リード（ぶっきらぼうだが的確）",
      "genau": "UI/UX設計（厳格で妥協なし）", 
      "zenze": "システム設計（平和的だが確実）",
      "lernen": "文書化（謙虚で完璧主義）"
    }
  },
  "agents": {
    "requirements-lead": {
      "character": "frieren",
      "worktree_path": "../requirements-lead",
      "config_file": "../requirements-lead/CLAUDE.md"
    },
    "ui-design": {
      "character": "genau",
      "worktree_path": "../ui-design",
      "config_file": "../ui-design/CLAUDE.md"
    },
    "implementation-support": {
      "character": "zenze", 
      "worktree_path": "../implementation-support",
      "config_file": "../implementation-support/CLAUDE.md"
    },
    "documentation": {
      "character": "lernen",
      "worktree_path": "../documentation",
      "config_file": "../documentation/CLAUDE.md"
    }
  },
  "shared_resources": {
    "reference_materials": "shared/参照資料.md",
    "requirements_doc": "shared/要件定義書.md"
  }
}
EOF

# 5. 初期コミット
echo "💾 初期コミット作成..."
git add .
git commit -m "feat: ${PROJECT_NAME} プロジェクト初期化

- フリーレンチーム設定
- 基本ディレクトリ構造作成
- 共有リソース配置
- Claude Code設定完了

チーム構成:
- フリーレン: 要件・設計リード
- ゲナウ: UI/UX設計
- ゼンゼ: システム設計  
- レルネン: 文書化"

# 6. Git Worktree＆キャラクター設定適用
echo "🌿 フリーレンチームのWorktree環境作成..."

# エージェント→キャラクター対応
declare -A agent_to_character=(
    ["requirements-lead"]="frieren"
    ["ui-design"]="genau"
    ["implementation-support"]="zenze"
    ["documentation"]="lernen"
)

declare -A character_names=(
    ["frieren"]="フリーレン"
    ["genau"]="ゲナウ"
    ["zenze"]="ゼンゼ"
    ["lernen"]="レルネン"
)

for agent in "${!agent_to_character[@]}"; do
    character=${agent_to_character[$agent]}
    character_name=${character_names[$character]}
    
    echo "  🎭 ${character_name}（${agent}）環境作成中..."
    
    # Worktree作成
    git worktree add -b "${agent}" "../${agent}"
    
    # キャラクター設定適用
    python3 ../../requirements-engineering-multiagent/scripts/generate-claude-configs.py \
        --team "$CHARACTER_TEAM" \
        --character "$character" \
        --agent "$agent" \
        --project-name "$PROJECT_NAME" \
        --output-dir "../${agent}"
    
    # 作業ディレクトリ作成
    mkdir -p "../${agent}/{work,output,sync}"
    
    # 共有リソースへのシンボリックリンク
    cd "../${agent}"
    ln -s "../${PROJECT_NAME}/shared" shared
    
    # エージェント初期化コミット
    git add .
    git commit -m "feat: ${character_name}（${agent}）エージェント初期化

キャラクター: ${character_name}
役割: $(echo ${agent} | sed 's/-/ /g')
設定ファイル: CLAUDE.md"
    
    cd "$PROJECT_DIR"
    echo "  ✅ ${character_name} 準備完了"
done

# 7. セットアップ完了
echo ""
echo "🎉 フリーレンチーム セットアップ完了！"
echo ""
echo "📂 作成されたディレクトリ:"
echo "  🏠 メインプロジェクト: ${PROJECT_DIR} (main ブランチ)"
for agent in "${!agent_to_character[@]}"; do
    character=${agent_to_character[$agent]}
    character_name=${character_names[$character]}
    echo "  🎭 ${character_name}: ../${agent}/ (${agent} ブランチ)"
done
echo ""
echo "🚀 使い方:"
echo "1. メインプロジェクトでフリーレンと要件定義開始:"
echo "   cd ${PROJECT_DIR} && claude"
echo ""
echo "2. 各キャラクターを並行起動（別ターミナルで）:"
for agent in "${!agent_to_character[@]}"; do
    character_name=${character_names[${agent_to_character[$agent]}]}
    echo "   cd ../${agent} && claude  # ${character_name}"
done
echo ""
echo "3. 共有ファイルで情報連携:"
echo "   - shared/要件定義書.md: 要件の構造化"
echo "   - shared/参照資料.md: 参考情報蓄積"
echo "   - 各エージェントのsync/: 進捗共有"
echo ""
echo "📚 詳細ガイド:"
echo "   https://github.com/username/requirements-engineering-multiagent/docs/getting-started.md"
echo ""
echo "🎭 フリーレンチームで素晴らしい要件定義を！"