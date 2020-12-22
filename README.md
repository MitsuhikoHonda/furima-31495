# README

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| kana_last_name        | string | null: false |
| kana_first_name       | string | null: false |
| birth_year            | int    | null: false |
| birth_month           | int    | null: false |
| birth_date            | int    | null: false |


### Association

has_many :items
has_many :purchase_history

## items デープル

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| item_name     | string     | null: false                  |
| description   | text       | null: false                  |
| condition     | string     | null: false                  |
| category      | string     | null: false                  |
| delivery_fee  | string     | null: false                  |
| ship_from     | string     | null: false                  |
| selling_price | int        | null: false                  |
| user_id       | references | null: false foreign_key: true|

belongs_to :user
has_one :purchase_history


## purchase_history テーブル

| Column               | Type       | Options                      |
| -------------------- | ---------- | ---------------------------- |
| user_id              | references | null: false foreign_key: true|
| item_id              | references | null: false foreign_key: true|
| credit_card_number   | int        | null: false                  |
| credit_exp_month     | int        | null: false                  |
| credit_exp_year      | int        | null: false                  |
| credit_security_code | int        | null: false                  |

belongs_to :items
has_one :shipping_address


## shipping_address  テーブル

| Column               | Type       | Options                      |
| -------------------- | ---------- | ---------------------------- |
| purchase_history_id  | references | null: false foreign_key: true|
| postal_code          | int        | null: false                  |
| prefecture           | string     | null: false                  |
| municipality         | string     | null: false                  |
| block_number         | string     | null: false                  |
| building_name        | string     | null: false                  |
| phone_number         | string     |                              |

belongs_to :purchase_history