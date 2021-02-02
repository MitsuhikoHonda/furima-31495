# README

## users テーブル

| Column                | Type   | Options                 |
| --------------------- | ------ | ------------------------|
| nickname              | string | null: false             |
| email                 | string | null: false unique: true|
| encrypted_password    | string | null: false             |
| last_name             | string | null: false             |
| first_name            | string | null: false             |
| kana_last_name        | string | null: false             |
| kana_first_name       | string | null: false             |
| birth_date            | date   | null: false             |


### Association

has_many :items
has_many :purchase_logs

## items デープル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| item_name     | string     | null: false                  |
| description   | text       | null: false                  |
| condition_id  | int        | null: false                  |
| category      | string     | null: false                  |
| delivery_fee  | string     | null: false                  |
| ship_from     | string     | null: false                  |
| selling_price | int        | null: false                  |
| user_id       | references | null: false foreign_key: true|

belongs_to :user
has_one :purchase_log


## purchase_logs テーブル

 <!-- _idは不要？ -->
| Column               | Type       | Options                      |
| -------------------- | ---------- | ---------------------------- |
| user_id              | references | null: false foreign_key: true|
| item_id              | references | null: false foreign_key: true|

belongs_to :user
belongs_to :item
has_one :shipping_address
 

## shipping_address  テーブル

| Column               | Type       | Options                      |
| -------------------- | ---------- | ---------------------------- |
| purchase_logs        | references | null: false foreign_key: true|
| postal_code          | string     | null: false                  |
| prefecture           | string     | null: false                  |
| municipality         | string     | null: false                  |
| block_number         | string     | null: false                  |
| building_name        | string     |                              |
| phone_number         | string     | null: false                  |

belongs_to :purchase_logs