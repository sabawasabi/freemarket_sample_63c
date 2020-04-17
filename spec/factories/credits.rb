FactoryBot.define do
  factory :credit do
    user_id     {"1"}
    customer_id {4242424242424242}
    card_id     {"123"}
  end
end
# user_id ... Userテーブルのid
# customer_id ... payjpの顧客id
# card_id ... payjpのデフォルトカードid
