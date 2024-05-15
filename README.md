# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|nick_name           | string | null: false |
|email               | string | null: false, unique: true |
|encrypted_password  | string | null: false |
|birthday            |  date  | null: false |
|last_name           | string | null: false |
|first_name          | string | null: false |
|next_last_name      | string | null: false |
|next_first_name     | string | null: false |

### Association

- has_many :articles
- has_many :records

## articles テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
|product       | string | null: false |
|category      | string | null: false |
|condition_id  | string | null: false |
|delivery_fee_id| string | null: false |
|source_id     | string | null: false |
|price         | integer | null: false |
|shipping_id   | string | null: false |
|description   |  text  | null: false |
|     user     | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column     | Type       | Options                       |
| ---------- | ------     | -----------                   |
|user        | references | null: false, foreign_key:true |
|article     | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :article
- has_one :address

## addresses

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
|post_code     | string | null: false |
|prefecture    | string | null: false |
|city          | string | null: false |
|building_name | string | null: false |
|house_number  | string | null: false |
|phone         | string | null: false |

### Association

- belongs_to :article
- belongs_to :record