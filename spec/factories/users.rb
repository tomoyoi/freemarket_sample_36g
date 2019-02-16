FactoryGirl.define do
  pass = Faker::Internet.password(6)

  factory :user2 do
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

  factory :user do
      id                      1
      email                   "aa@aa"
      initialize_with { User.find_or_create_by(email: email)}
      password                "00000000"
      encrypted_password      "00000000"
      nickname                "abe"
      last_name               "abe"
      first_name              "abe"
      last_name_kana          "abe"
      first_name_kana         "abe"
      postcode                "000-0000"
      prefecture              "chiba"
      city                    "chiba"
      house_number            "0000-0000-0000"
      building                "000-0000"
      tel_number              "0000-0000"
      profile                 "AAAAAAAAA"
  end
end
