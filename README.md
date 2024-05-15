# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|name                | string | null: false |
|email               | string | null: false, unique: true |
|encrypted_password  | string | null: false |
|birthday            | string | null: false |

### Association

- has_many :articles
- has_many :records

## articles テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
|product       | string | null: false |
|category      | string | null: false |
|condition     | string | null: false |
|delivery_fee  | string | null: false |
|source        | string | null: false |
|price         | string | null: false |
|shipping      | string | null: false |
|description   |  text  | null: false |
|seller_user   | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- has_one :record

## records テーブル

| Column     | Type       | Options                       |
| ---------- | ------     | -----------                   |
|buyer_user  | references | null: false, foreign_key:true |
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
|house_number  | string | null: false |
|phone         | string | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :record