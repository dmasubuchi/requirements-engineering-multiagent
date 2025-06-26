# UIコンポーネント設計書

## プロジェクト情報
- **プロジェクト名**: {{PROJECT_NAME}}
- **バージョン**: 1.0.0
- **作成日**: {{DATE}}
- **作成者**: UI設計者（ゲナウのUI設計を詳細化）

## 1. デザインシステム概要

### 1.1 デザイン原則
- **一貫性**: 全画面で統一されたUI
- **直感性**: 学習不要な操作性
- **アクセシビリティ**: WCAG 2.1 AA準拠
- **レスポンシブ**: モバイルファースト

### 1.2 カラーパレット

```css
/* Primary Colors */
--primary-500: #3B82F6;  /* メインカラー */
--primary-600: #2563EB;  /* ホバー時 */
--primary-100: #DBEAFE;  /* 背景色 */

/* Neutral Colors */
--gray-900: #111827;     /* テキスト */
--gray-700: #374151;     /* サブテキスト */
--gray-300: #D1D5DB;     /* ボーダー */
--gray-100: #F3F4F6;     /* 背景 */

/* Semantic Colors */
--success: #10B981;      /* 成功 */
--warning: #F59E0B;      /* 警告 */
--error: #EF4444;        /* エラー */
--info: #3B82F6;         /* 情報 */
```

### 1.3 タイポグラフィ

```css
/* Font Family */
--font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", "Noto Sans JP", sans-serif;

/* Font Sizes */
--text-xs: 0.75rem;      /* 12px */
--text-sm: 0.875rem;     /* 14px */
--text-base: 1rem;       /* 16px */
--text-lg: 1.125rem;     /* 18px */
--text-xl: 1.25rem;      /* 20px */
--text-2xl: 1.5rem;      /* 24px */
--text-3xl: 1.875rem;    /* 30px */

/* Font Weights */
--font-normal: 400;
--font-medium: 500;
--font-semibold: 600;
--font-bold: 700;
```

### 1.4 スペーシング

```css
/* Spacing Scale */
--space-1: 0.25rem;      /* 4px */
--space-2: 0.5rem;       /* 8px */
--space-3: 0.75rem;      /* 12px */
--space-4: 1rem;         /* 16px */
--space-5: 1.25rem;      /* 20px */
--space-6: 1.5rem;       /* 24px */
--space-8: 2rem;         /* 32px */
--space-10: 2.5rem;      /* 40px */
--space-12: 3rem;        /* 48px */
```

## 2. コンポーネント設計

### 2.1 ボタン（Button）

#### デザイン仕様
```css
/* Primary Button */
.btn-primary {
  background-color: var(--primary-500);
  color: white;
  padding: var(--space-2) var(--space-4);
  border-radius: 0.375rem;
  font-weight: var(--font-medium);
  transition: all 0.2s;
}

.btn-primary:hover {
  background-color: var(--primary-600);
  transform: translateY(-1px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* サイズバリエーション */
.btn-sm { padding: var(--space-1) var(--space-3); }
.btn-lg { padding: var(--space-3) var(--space-6); }
```

#### 使用例
```html
<!-- Primary Button -->
<button class="btn btn-primary">保存する</button>

<!-- Secondary Button -->
<button class="btn btn-secondary">キャンセル</button>

<!-- Danger Button -->
<button class="btn btn-danger">削除する</button>
```

### 2.2 フォーム要素（Form Elements）

#### 入力フィールド
```css
.form-input {
  width: 100%;
  padding: var(--space-2) var(--space-3);
  border: 1px solid var(--gray-300);
  border-radius: 0.375rem;
  font-size: var(--text-base);
  transition: border-color 0.2s;
}

.form-input:focus {
  outline: none;
  border-color: var(--primary-500);
  box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}
```

#### ラベル
```css
.form-label {
  display: block;
  margin-bottom: var(--space-1);
  font-size: var(--text-sm);
  font-weight: var(--font-medium);
  color: var(--gray-700);
}
```

### 2.3 カード（Card）

```css
.card {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  padding: var(--space-6);
  transition: box-shadow 0.2s;
}

.card:hover {
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card-header {
  margin-bottom: var(--space-4);
  padding-bottom: var(--space-4);
  border-bottom: 1px solid var(--gray-200);
}

.card-title {
  font-size: var(--text-xl);
  font-weight: var(--font-semibold);
  color: var(--gray-900);
}
```

## 3. レイアウトパターン

### 3.1 グリッドシステム

```css
.container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 var(--space-4);
}

.grid {
  display: grid;
  gap: var(--space-6);
}

.grid-cols-1 { grid-template-columns: repeat(1, 1fr); }
.grid-cols-2 { grid-template-columns: repeat(2, 1fr); }
.grid-cols-3 { grid-template-columns: repeat(3, 1fr); }
.grid-cols-4 { grid-template-columns: repeat(4, 1fr); }

/* レスポンシブ */
@media (min-width: 768px) {
  .md\:grid-cols-2 { grid-template-columns: repeat(2, 1fr); }
  .md\:grid-cols-3 { grid-template-columns: repeat(3, 1fr); }
}
```

### 3.2 ナビゲーション

```css
.navbar {
  background-color: white;
  border-bottom: 1px solid var(--gray-200);
  padding: var(--space-4) 0;
}

.nav-link {
  color: var(--gray-700);
  text-decoration: none;
  padding: var(--space-2) var(--space-4);
  border-radius: 0.375rem;
  transition: all 0.2s;
}

.nav-link:hover {
  background-color: var(--gray-100);
  color: var(--primary-600);
}

.nav-link.active {
  color: var(--primary-600);
  background-color: var(--primary-100);
}
```

## 4. インタラクションパターン

### 4.1 ローディング状態

```html
<!-- スピナー -->
<div class="spinner">
  <div class="spinner-circle"></div>
</div>

<!-- スケルトンローディング -->
<div class="skeleton">
  <div class="skeleton-line"></div>
  <div class="skeleton-line skeleton-line-short"></div>
</div>
```

### 4.2 トースト通知

```javascript
// 成功通知
showToast({
  type: 'success',
  message: '保存しました',
  duration: 3000
});

// エラー通知
showToast({
  type: 'error',
  message: 'エラーが発生しました',
  duration: 5000
});
```

### 4.3 モーダル

```html
<div class="modal" id="confirmModal">
  <div class="modal-backdrop"></div>
  <div class="modal-content">
    <div class="modal-header">
      <h3 class="modal-title">確認</h3>
      <button class="modal-close">&times;</button>
    </div>
    <div class="modal-body">
      <p>本当に削除しますか？</p>
    </div>
    <div class="modal-footer">
      <button class="btn btn-secondary">キャンセル</button>
      <button class="btn btn-danger">削除</button>
    </div>
  </div>
</div>
```

## 5. アクセシビリティ

### 5.1 キーボードナビゲーション
- すべての操作要素にフォーカス可能
- Tabキーでの移動順序が論理的
- Escキーでモーダルを閉じる

### 5.2 スクリーンリーダー対応
```html
<!-- ARIAラベル例 -->
<button aria-label="メニューを開く" class="menu-button">
  <svg><!-- ハンバーガーアイコン --></svg>
</button>

<!-- ライブリージョン -->
<div role="alert" aria-live="polite">
  保存しました
</div>
```

### 5.3 カラーコントラスト
- 通常テキスト: 4.5:1 以上
- 大きなテキスト: 3:1 以上
- インタラクティブ要素: 3:1 以上

## 6. レスポンシブ対応

### 6.1 ブレークポイント
```css
/* Mobile First */
/* Default: 0-639px */

/* Tablet */
@media (min-width: 640px) { /* sm */ }
@media (min-width: 768px) { /* md */ }

/* Desktop */
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
```

### 6.2 モバイル最適化
- タッチターゲット: 最小44×44px
- フォントサイズ: 最小14px
- 横スクロール禁止
- ピンチズーム可能

## 7. パフォーマンス考慮

### 7.1 CSS最適化
- Critical CSS のインライン化
- 未使用CSSの削除
- CSS圧縮

### 7.2 画像最適化
- 適切なフォーマット（WebP、AVIF）
- レスポンシブ画像
- 遅延読み込み

### 7.3 アニメーション
- GPU加速を活用
- will-changeの適切な使用
- 60fpsを維持

---
*このドキュメントはゲナウのUI設計を基に、開発実装用に詳細化されました*
*「妥協は許さない。ピクセルパーフェクトを目指せ」 - ゲナウ*