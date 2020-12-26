# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nick_name| string | null: false |
| address  | string | null: false |

### Association

- has_many :exhibit
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     |                                |
| user_id      | references | null: false, foreign_key: true |
| tweet_text   | references | null: false, foreign_key: true |

### Association

- belongs_to :exhibit
- belongs_to :users

## exhibit テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | string | null: false |
| image    | string | null: false |
| user_id  | string | null: false |

### Association

- has_many :comments
- belongs_to :users
