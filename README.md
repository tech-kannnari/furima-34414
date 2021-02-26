# README

#テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| encrypted_password    | string | null: false |
| last_name             | string | null: false |
| name                  | string | null: false |
| last_kana             | string | null: false |
| kana                  | string | null: false |
| birthday              | date   | null: false |  

### Association

- has_many   : items
- has_many   : histories
- belongs_to : buy


## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| item_name     | string     | null: false                   |
| description   | text       | null: false                   |
| category      | integer    | null: false                   | 
| item_status   | integer    | null: false,                  | 
| delivery_fee  | integer    | null: false                   | 
| delivery_area | integer    | null: false,                  |
| delivery_day  | integer    | null: false                   | 
| price         | integer    | null: false,                  |  
| user          | references | null: false, foreign_key:true |


//imageはActiveStorageで実装

### Association

- belongs_to : user
- belongs_to : history
- belongs_to : buyer


## buyers テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| postal_code    | string     | null: false                   |
| area           | integer    | null: false                   |
| municipalities | string     | null: false                   | 
| address        | string     | null: false,                  | 
| building       | string     | null: false,                  |
| phone_number   | string     | null: false,                  | 
| user           | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :history


## history テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item_name   | references | null: false, foreign_key:true |
| user        | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :history



