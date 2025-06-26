#!/bin/bash
# Export to Development Engineering System
# 設計仕様を開発チームにエクスポート

set -e

echo "📤 Export Design Specifications to Development Team"
echo "================================================="
echo ""

# デフォルトパス
DESIGN_BASE_DIR="../設計フェーズ"
DEV_PROJECT_DIR=""

# 引数解析
while [[ $# -gt 0 ]]; do
    case $1 in
        --dev-project)
            DEV_PROJECT_DIR="$2"
            shift 2
            ;;
        --help)
            echo "使用方法:"
            echo "  $0 --dev-project <path-to-dev-project>"
            echo ""
            echo "オプション:"
            echo "  --dev-project <path>  開発プロジェクトのパス"
            echo ""
            echo "例:"
            echo "  $0 --dev-project ../../../development-engineering-multiagent/my-project"
            exit 0
            ;;
        *)
            echo "❌ 不明なオプション: $1"
            exit 1
            ;;
    esac
done

# 必須パラメータチェック
if [ -z "$DEV_PROJECT_DIR" ]; then
    echo "❌ エラー: 開発プロジェクトのパスを指定してください"
    echo "使用方法: $0 --dev-project <path>"
    exit 1
fi

# ディレクトリ存在チェック
if [ ! -d "$DEV_PROJECT_DIR" ]; then
    echo "❌ エラー: 開発プロジェクトが見つかりません: $DEV_PROJECT_DIR"
    exit 1
fi

# 設計ディレクトリの確認
if [ ! -d "$DESIGN_BASE_DIR" ]; then
    echo "❌ エラー: 設計フェーズディレクトリが見つかりません"
    echo "このスクリプトは '統合ツール' ディレクトリから実行してください"
    exit 1
fi

echo "🎯 エクスポート設定:"
echo "  設計仕様元: $DESIGN_BASE_DIR"
echo "  エクスポート先: $DEV_PROJECT_DIR"
echo ""

# エクスポート処理
echo "📋 設計仕様をエクスポート中..."

# アーキテクチャ設計
if [ -d "$DESIGN_BASE_DIR/アーキテクチャ設計" ]; then
    echo "  🏗️ アーキテクチャ設計..."
    mkdir -p "$DEV_PROJECT_DIR/shared/specs/architecture"
    cp -r "$DESIGN_BASE_DIR/アーキテクチャ設計/"* "$DEV_PROJECT_DIR/shared/specs/architecture/" 2>/dev/null || true
fi

# API設計
if [ -d "$DESIGN_BASE_DIR/API設計" ]; then
    echo "  🔌 API設計..."
    mkdir -p "$DEV_PROJECT_DIR/shared/specs/api"
    cp -r "$DESIGN_BASE_DIR/API設計/"* "$DEV_PROJECT_DIR/shared/specs/api/" 2>/dev/null || true
fi

# データベース設計
if [ -d "$DESIGN_BASE_DIR/データベース設計" ]; then
    echo "  🗄️ データベース設計..."
    mkdir -p "$DEV_PROJECT_DIR/shared/specs/database"
    cp -r "$DESIGN_BASE_DIR/データベース設計/"* "$DEV_PROJECT_DIR/shared/specs/database/" 2>/dev/null || true
fi

# UI設計
if [ -d "$DESIGN_BASE_DIR/UI設計" ]; then
    echo "  🎨 UI設計..."
    mkdir -p "$DEV_PROJECT_DIR/shared/specs/ui"
    cp -r "$DESIGN_BASE_DIR/UI設計/"* "$DEV_PROJECT_DIR/shared/specs/ui/" 2>/dev/null || true
fi

# 要件定義書も含める
REQUIREMENTS_DOC="../../shared/要件定義書.md"
if [ -f "$REQUIREMENTS_DOC" ]; then
    echo "  📄 要件定義書..."
    cp "$REQUIREMENTS_DOC" "$DEV_PROJECT_DIR/shared/specs/requirements.md"
fi

# エクスポート記録作成
cat > "$DEV_PROJECT_DIR/shared/specs/export-info.md" << EOF
# 設計仕様エクスポート情報

## エクスポート日時
$(date +"%Y-%m-%d %H:%M:%S")

## エクスポート元
- Requirements Engineering MultiAgent System
- 設計フェーズ完了済み

## 含まれる仕様書
- アーキテクチャ設計
- API設計（OpenAPI仕様）
- データベース設計
- UI設計
- 要件定義書（参考）

## 開発チームへの申し送り

### 重要事項
1. 各仕様書を熟読してから実装を開始してください
2. 不明点は shared/questions/ に記載してください
3. 設計からの逸脱がある場合は必ず相談してください

### 優先順位
1. コアとなるAPI実装
2. データベース構築
3. フロントエンド基本機能
4. テスト実装
5. デプロイメント準備

### 連絡事項
- 週次で進捗レビューを実施
- 重大な問題は即座にエスカレーション
- ドキュメントは随時更新

---
*フリーレンチームから開発チームへ*
*「設計は終わった。あとは君たちの腕の見せどころだ」 - フリーレン*
EOF

echo ""
echo "✅ エクスポートが完了しました！"
echo ""
echo "📂 エクスポートされたファイル:"
find "$DEV_PROJECT_DIR/shared/specs" -type f -name "*.md" -o -name "*.yaml" | head -10
echo ""
echo "🚀 次のステップ:"
echo "1. 開発プロジェクトディレクトリに移動"
echo "   cd $DEV_PROJECT_DIR"
echo "2. 開発チームのセットアップを実行"
echo "3. 各エージェントで実装開始"
echo ""
echo "💡 開発チームは shared/specs/ の仕様書を参照して実装を進めます"