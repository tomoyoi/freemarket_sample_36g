class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :user

  def set_main_thumbnail
    images.first.image
  end
end
