# テーブルスキーマ

#### Tasksテーブル
|カラム名|データ型|カラム説明|
|:---:|:---:|:---:|
|task_name|string|タスクの名前|
|details|string|タスクの詳細|
|deadline_at|datetime|締め切りを管理する|
|priority|int|優先順位管理|
|status|int|ステータス管理をする|
|user_id|int|外部キー|
|created_at|datetime| |
|updated_at|datetime| |

#### Labelsテーブル
|カラム名|データ型|カラム説明|
|:---:|:---:|:---:|
|label|string|ラベル名|
|created_at|datetime| |
|updated_at|datetime| |

#### TaskLabelsテーブル
|カラム名|データ型|カラム説明|
|:---:|:---:|:---:|
|task_id|int|外部キー|
|label_id|int|外部キー|
|created_at|datetime| |
|updated_at|datetime| |

#### Usersテーブル
|カラム名|データ型|カラム説明|
|:---:|:---:|:---:|
|name|string|ユーザーネーム|
|email|string|メールアドレス|
|password_digest|string|パスワード|
|created_at|datetime| |
|updated_at|datetime| |
