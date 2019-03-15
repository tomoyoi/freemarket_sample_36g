class Category < ApplicationRecord
  has_many :items
  # has_many :item_categories
end
