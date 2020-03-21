FactoryBot.define do
  factory :user do
    nickname      {"test-nickname"}
    email         {"test-email@test.com"}
    password      {"testpass"}
    last_name     {"last-name"}
    first_name    {"first-name"}
    last_name_jp  {"苗字"}
    first_name_jp {"名前"}
    birth_date    {"2020-01-01"}
    phone_number  {"00000000000"}
    profile       {"プロフィール文"}
    icon          {"アイコン"}
  end
end