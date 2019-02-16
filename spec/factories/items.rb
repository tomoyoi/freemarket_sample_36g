FactoryGirl.define do

  factory :item do
    id             1
    name           "shirt"
    price          600
    description    "goood!"
    delivery_fee   1
    area           1
    size           1
    association :seller,  factory: :user
    association :buyer,  factory: :user
    brand          "adiadi"
    condition      "aaaaa"
    delivery_method "sssss"
    standard_shipping_time "sssss"
  end

end
