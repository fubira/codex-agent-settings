# Codex Base Settings

Codex の複数環境で共有する基本設定を管理するリポジトリである。

## 管理対象

- `AGENTS.md`: 全環境で共有する基本指示
- `rules/default.rules`: 承認済みコマンドの共通ルール
- `skills/code-review/`: コードレビュー用のユーザー追加 skill
- `skills/refactoring/`: リファクタリング用のユーザー追加 skill
- `config.example.toml`: `config.toml` の共有可能なテンプレート

## 管理対象外

- `auth.json`: 認証情報
- `config.toml`: 絶対パスなど環境依存の設定
- `sessions/`, `history.jsonl`, `log/`, `logs_*.sqlite*`, `state_*.sqlite*`: 履歴・ログ・状態
- `cache/`, `models_cache.json`, `.tmp/`: キャッシュ・一時ファイル
- `skills/.system/`: Codex が配布する system skill

## 新しい環境での使い方

1. このリポジトリを `$CODEX_HOME` として使う場所に配置する。
2. `config.example.toml` を参考に、各環境で `config.toml` を作成する。
3. `auth.json` は各環境で Codex のログイン手順に従って作成する。
4. プロジェクト固有の trust 設定は各環境の `config.toml` にだけ追加する。

## 注意

`.gitignore` は原則すべてを無視し、共有対象だけを明示的に許可する。新しい共有ファイルを追加する場合は、秘密情報・履歴・環境依存パスが含まれないことを確認してから許可する。
