# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|default:“”,null: false|
|email|string|default: “”, null: false|
|encrypted-password|string|default: “”, null: false|
|confirm-password|string|default:“”,null: false|
|first-name|string|default:“”, null: false|
|last-name|string|default:“”, null: false|
|first-name-kata|string|default:“”, null: false|
|last-name-kata|string|default:“”, null: false|
|year|integer|default:“”, null: false|
|month|integer|default:“”, null: false|
|day|integer|default:“”, null: false|
|postal-code|integer|default:“”, null: false|
|prefectutre|string|default:“”, null: false|
|city|string|default:“”, null: false|
|block|string|default:“”, null: false|
|building|string|default:“”, null: false|
|phone-number|integer|default:“”, null: false|

### Assosiation
- has_many :items_of_seller, class_name: 'item', foreign_key: 'seller_id'
- has_many :items_of_buyer, class_name: 'item', foreign_key: 'buyer_id'
-has_many :rates
-has_many :comments
-has_many :likes

## items

|Colum|Type|Options|
|-----|----|-------|
|name|string|null: false, index: true|
|image|string|null: false|
|description|text||
|brand|string||
|state|string|null: false|
|ship_region|string||
|ship-charge|string|null: false|
|ship-method|string|null: false|
|ship-date|text|null: false|
|price|integer|null:false|
|sellar_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Assosiation
- has_many :messages
- has_many :categories, through: :category_items
- has_many :category_items
- has_many :comments
- has_many :likes

- has_one :rates
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'

## messagesテーブル
| Column| Type | Options |
|-------|------|---------|
| item_id| references| null: false, foreign_key: true |
| content| text||
### Association
- belongs_to :item

## ratesテーブル
| Column| Type| Options|
|-------|-----|--------|
| user_id| references| null: false, foreign_key: true |
| item_id| references| null: false, foreign_key: true |
| buyer_comment  | text        ||
| seller_comment | text        ||
| buyer_rate     | integer     | null: false                    |
| seller_rate    | integer     | null: false                    |

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
| Column        | Type       | Options                      |
|---------------|------------|------------------------------|
| user_id      |references      | null: false, foreign_key: true |
| item_id      |references   | null: false, foreign_key: true |
| content|text||

### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
| Column        | Type       | Options                      |
|---------------|------------|------------------------------|
| user_id          |references     | null: false, foreign_key: true |
| item_id           |references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル
| Column        | Type       | Options                      |
|---------------|------------|------------------------------|
| name           | string      | null: false                    |

### Association
- has_many   :category_items
- has_many   :items, through: :category_items

## category_itemsテーブル
| Column        | Type       | Options                      |
|---------------|------------|------------------------------|
| category_id       | references   | null: false, foreign_key: true |
| item_id           | references   | null: false, foreign_key: true |

### Association
- belongs_to :category
- belongs_to :item

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
