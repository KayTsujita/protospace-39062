# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| profile            | text   | null: false |
| group              | string | null: false |
| position           | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :prototype_users
- has_many :prototypes, through: :post_users
- has_many :comments

## prototypes テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| prototype_name   | string     | null: false |
| catchphrase      | string     | null: false |
| concept          | text       | null: false |
| image            | references | null: false |

### Association

- has_many :prototype_users
- has_many :users, through: :room_users
- has_many :comments

## prototypes_users テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| comment | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user

## comment テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     |                                |
| user         | references | null: false, foreign_key: true |
| prototype    | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user