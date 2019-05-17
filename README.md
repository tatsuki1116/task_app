# テーブルスキーマ

#### Tasksテーブル
|カラム名|データ型|カラム説明|
|:---:|:---:|:---:|
|task|string|タスク名|
|details|string|タスク詳細|
|deadline|datetime|締め切り||
|status|int|ステータス|
|user_id|int|外部キー|
|created_at|datetime| |
|updated_at|datetime| |

#### Labelsテーブル
|カラム名|データ型|備考欄|
|:---:|:---:|:---:|
|label|string|ラベル名|
|created_at|datetime| |
|updated_at|datetime| |

#### TaskLabelsテーブル
|カラム名|データ型|備考欄|
|:---:|:---:|:---:|
|task_id|int|外部キー|
|label_id|int|外部キー|
|created_at|datetime| |
|updated_at|datetime| |

#### Usersテーブル
|カラム名|データ型|備考欄|
|:---:|:---:|:---:|
|name|string|ユーザーネーム|
|email|string|メールアドレス|
|password_digest|string|パスワード|
|created_at|datetime| |
|updated_at|datetime| |