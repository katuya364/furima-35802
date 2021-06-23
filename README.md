# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column              |Type    |Options      |
|------------------- |------- |------------ |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |


### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column            |Type        |Options                         |
|----------------- |----------- |------------------------------- |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| prefecture       | string     | null: false                    |
| days             | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :orders

## ordersテーブル

|Column |Type        |Options                         |
|------ |----------- |------------------------------- |
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping address

## shipping addressテーブル

|Column             |Type        |Options                         |
|------------------ |----------- |------------------------------- |
| credit_number     | integer    | null: false                    |
| credit_pin        | integer    | null: false                    |
| credit_valid_date | date       | null: false                    |
| street_address    | string     | null: false                    |
| postal_code       | integer    | null: false                    |
| prefecture        | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | integer    | null: false                    |
| building_name     | integer    | null: false                    |
| phone_number      | integer    | null: false                    |
| order             | references | null: false, foreign_key: true |


### Association
- belongs_to :order
