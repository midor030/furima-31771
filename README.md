# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ---------           | ------ | ----------- |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| familyname_kanji    | string | null: false | 
| firstname_kanji     | string | null: false |
| familyname_kana     | string | null: false | 
| firstname_kana      | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| item        | string     | null: false                    | 
| explain     | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| load_id     | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| days_id     | integer    | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :orders


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_no         | integer    | null: false                    |
| expriation_date | integer    | null: false                    |
| cvc             | integer    | null: false                    |
| item_id         | references | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses　テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | integer    | null: false                    |
| prefecture      | integer    | null: false                    |
| cities          | integer    | null: false                    |
| address         | integer    | null: false                    |
| building        | integer    | null: false                    |
| tel             | integer    | null: false                    |
| orders_id       | references | null: false, foreign_key: true |


### Association

- belongs_to :order