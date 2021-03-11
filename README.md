# README

#テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| last_name             | string | null: false               |
| name                  | string | null: false               |
| last_kana             | string | null: false               |
| kana                  | string | null: false               |
| birthday              | date   | null: false               |  

### Association

- has_many   : items
- has_many   : histories


## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| description      | text       | null: false                   |
| category_id      | integer    | null: false                   | 
| item_status_id   | integer    | null: false,                  | 
| delivery_fee_id  | integer    | null: false                   | 
| delivery_area_id | integer    | null: false,                  |
| delivery_day_id  | integer    | null: false                   | 
| price            | integer    | null: false,                  |  
| user             | references | null: false, foreign_key:true |


//imageはActiveStorageで実装

### Association

- belongs_to : user
- has_one    : history


## buyers テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| postal_code      | string     | null: false                   |
| delivery_area_id | integer    | null: false,                  |
| municipalities   | string     | null: false                   | 
| address          | string     | null: false,                  | 
| building         | string     |                               |
| phone_number     | string     | null: false,                  | 
| history          | references | null: false, foreign_key:true |

### Association

- belongs_to :history


## histories テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| item   | references | null: false, foreign_key:true |
| user   | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer



