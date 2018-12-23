# Users Table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|stirng|null: false, unique: ture|
|password|string|null: false|
|password_confarmation|stirng|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|postcode|string|null: false|
|prefeature|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string||
|tel-number|string|null: false|
|profile|text||

## Association
- has_one :identification
- has_one :payment
- has_many :likes
- has_many :items
- has_many :relationships, class_name: "Relationship", foregin_key: "follower_id", dependent: :destroy


# Identification Table
|Column|Type|Options|
|------|----|-------|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname-kana|string|null: false|
|firstname-kana|string|null: false|
|postcode|string|null: false|
|prefeacture|integure|null: false|
|city|string|null: false|
|house_number|string|null: false|
|birthdate|string|null: false|
|user|reference|null: false, foreign_key: true|

## Association
- belongs_to :user



# Payment Table
|Column|Type|Options|
|------|----|-------|
|card_number|string|null: false,unique: true|
|expired_date_month|string|null: false|
|expired_date_year|string|null: false|
|security_code|string|null: false|
|user|reference|null: false, foreign_key|

## Association
- belongs_to :user


# Relationships Table(use gem)
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false, index: true|
|following_id|integer|null: false, index: true|

## Association
- belongs_to :follower, class_name: "User"



# Evaluations Table
|Column|Type|Options|
|------|----|-------|
|mark|integer|null: false|
|relationship_id|reference|null: false, index: true, foreign_key: true|
|comment|text||

## Association
- belongs_to :relationship



# Purchase_histories Table
|Column|Type|Options|
|------|----|-------|
|relationship_id|reference|null: false, index: true, foreign_key: true|
|item|reference|null: false, index: true, foreign_key: true|

## Association
- belongs_to :relationship




# Items Table
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false|
|description|text|null: false|
|delivery_fee|integer|null: false|
|area|integer|null: false|
|price|string|null: false|
|size|string|null: false|
|category_id|integer|null: false, index: true|
|user|reference|null: faluse,foreign_key: true|

## Association
- belongs_to :user
- has_many :item_comments
- has_many :likes
- has_many :item_categories
- has_many :categories, through: :item_categories



# item_comments
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, unique: true|
|item_id|integer|null: false, unique: true|

## Association
- belongs_to :item



#likes
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, unique: true|
|item_id|integer|null: false, unique: true|

## Association
- belongs_to :user
- belongs_to :item



# item_categories
Column|Type|Options|
|------|----|-------|
|category_id|integer|null: false, unique: true|
|item_id|integure|null: false, unique: true|

## Association
- belongs_to :item
- belongs_to :category



# categories Table
Column|Type|Options|
|------|----|-------|
|parent|reference|foreign_key: true|
|name|string|null: false|

##Association
- has_many :children, class_name: "Category",foregin_key: "parent_id"
- belongs_to :parent, class_name: "Category"
