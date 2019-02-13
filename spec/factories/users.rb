FactoryGirl.define do
  pass = Faker::Internet.password(6)

  factory :user do
    nickname            Faker::Name.name
    email               Faker::Internet.email
    password             pass
    password_confirmation pass
    last_name           Faker::Name.last_name
    first_name          Faker::Name.first_name
    last_name_kana      Faker::Name.last_name
    first_name_kana     Faker::Name.first_name
    postcode            Faker::Address.postcode
    prefecture          Faker::Address.state
    city                Faker::Address.city
    house_number        Faker::Address.building_number
    building            Faker::Address.street_name
    tel_number          Faker::PhoneNumber.phone_number
    profile             ""
  end
end
