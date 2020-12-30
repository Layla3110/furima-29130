# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| firstname          | string | null: false |
| surname            | string | null: false |
| firstname_kana     | string | null: false |
| surname_kana       | string | null: false |
| email              | string | null: false |
| birthdata          | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :exhibits
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

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| item_name    | string | null: false |
| amount       | string | null: false |
| condition    | string | null: false |
| delivery_fee | string | null: false |
| ship_from    | string | null: false |
| duration     | string | null: false |
| text         | text   | null: false |
| category     | string | null: false |
| user_id      | string | null: false |

### Association

- has_many :comments
- belongs_to :user
