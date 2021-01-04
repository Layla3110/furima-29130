# テーブル設計

## users テーブル

| Column             | Type   | Options             |
| ------------------ | ------ | ------------------- |
| firstname          | string | null: false         |
| surname            | string | null: false         |
| firstname_kana     | string | null: false         |
| surname_kana       | string | null: false         |
| nickname           | string | null: false         |
| email              | string | null: false, default|
| birthdata          | date   | null: false         |
| encrypted_password | string | null: false         |

### Association

- has_many :exhibits
- has_many :comments
- has_many :purchase_histories 

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     |                                |
| user_id      | references | null: false, foreign_key: true |
| tweet_text   | references | null: false, foreign_key: true |

### Association

- belongs_to :exhibit
- belongs_to :user

## exhibit テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| amount          | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| duration_id     | integer    | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :purchase_history

## address テーブル

| Column           | Type       | Options                        |
| -------------    | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_history

## purchase_history テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| exhibit | references | null: false , foreign_key: true|
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :exhibit


