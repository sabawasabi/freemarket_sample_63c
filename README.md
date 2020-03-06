# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|nickname|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_jp|string|null: false|
|first_name_jp|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer||
|profile|text||
|icon|text||

### Association
- has_many :credit_cards
- has_many :transactions
- has_one :address
- has_many :likes
- has_many :comments
- has_many :products


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building|string||

### Association
- belongs_to :user


## credit_cardsテーブル
|Column|type|Option|
|------|----|------|
|id|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|card_number|integer|null: false|
|exp_month|integer|null: false|
|exp_year|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user


## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|
|message|text||

### Association
- belongs_to :user
- belongs_to :product


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|description|text|null: false|
|category_path|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|condition|string|null: false|
|shipping _charges|string|null: false|
|shipping_area|string|null: false|
|days_to_delivery|string|null: false|
|price|integer|null: false|

### Association
- has_many :product_images
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :transactions
- has_many :likes
- has_many :comments


## product_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image|text||

### Association
- belongs_to :product


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|path|string|null: false, unique: true|
|category_name|string|null: false|

### Association
- has_many :products


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|brand_name|string|null: false, unique: true|
|brand_group_id|intsger|null: false|

### Association
- has_many :products