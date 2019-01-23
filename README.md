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
- has_many :evaluations
- has_many :commented_evaluations, class_name: 'Evaluation', :foreign_key => 'commented_id'
- has_many :commenter_evaluations, class_name: 'Evaluation', :foreign_key => 'commenter_id'
- has_many :buyer_items, class_name: 'Item', :foreign_key => 'buyer_id'
- has_many :seller_items, class_name: 'Item', :foreign_key => 'seller_id'



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



---Pending---Act as Follower
<!-- # Relationships Table(use gem)
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false, index: true|
|following_id|integer|null: false, index: true|

## Association
- belongs_to :follower, class_name: "User"
- has_one :evaluation
- has_one :purchase_history -->



# Evaluations Table
|Column|Type|Options|
|------|----|-------|
|mark|integer|null: false|
|commented_id|reference|null: false, index: true, foreign_key: true|
|commenter_id|reference|null: false, index: true, foreign_key: true|
|comment|text||

## Association
-belongs_to :commented, class_name: 'User', :foreign_key => 'commented_id'
-belongs_to :commenter, class_name: 'User', :foreign_key => 'commenter_id'



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
|user|reference|null: false,foreign_key: true|
|seller_id|integer|null:false, index: true|
|buyer_id|integer|index: true|
|status|integer|index: true|

## Association
- belongs_to :user
- has_many :item_comments
- has_many :likes
- has_many :item_categories
- has_many :categories, through: :item_categories
- belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'
- belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'



# item_comments
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, unique: true,foreign_key: true|
|item_id|reference|null: false, unique: true,foreign_key: true|
|comment|text||

## Association
- belongs_to :item
- belongs_to :user



# likes
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
|category_id|reference|null: false, unique: true,foreign_key: true|
|item_id|reference|null: false, unique: true,foreign_key: true|

## Association
- belongs_to :item
- belongs_to :category



# categories Table
Column|Type|Options|
|------|----|-------|
|parent|reference|foreign_key: true|
|name|string|null: false|

## Association
- has_many :children, class_name: "Category",foregin_key: "parent_id"
- belongs_to :parent, class_name: "Category"
