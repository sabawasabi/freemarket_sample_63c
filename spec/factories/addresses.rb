FactoryBot.define do

  factory :address do
    last_name                {"山田"}
    first_name               {"太郎"}
    last_name_jp             {"ヤマダ"}
    first_name_jp            {"タロウ"}
    postal_code              {"1234567"}
    prefectures              {"13"}
    city                     {"江戸川区"}
    house_number             {"江戸川1-1-1"}
    building                 {"駅前ビル101"}
    phone_number             {"09012345678"}
  end

end