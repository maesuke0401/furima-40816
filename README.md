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

- has_many :items
- has_many :records

## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
|product       | string | null: false |
|category_id   | integer | null: false |
|condition_id  | integer | null: false |
|delivery_fee_id| integer | null: false |
|source_id     | integer | null: false |
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
- belongs_to :item
- has_one :address

## addresses

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
|post_code     | string | null: false |
|source_id     | integer | null: false |
|city          | string | null: false |
|building_name | string |             |
|house_number  | string | null: false |
|phone         | string | null: false |
|record        | references| null: false, foreign_key:true |

### Association

- belongs_to :records