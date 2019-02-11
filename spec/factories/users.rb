FactoryGirl.define do

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
