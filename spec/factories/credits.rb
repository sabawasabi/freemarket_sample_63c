FactoryBot.define do
  factory :credit do
    user_id     {""}
    customer_id {}
    card_id     {""}
    
  end
end
# user_id ... Userテーブルのid
# customer_id ... payjpの顧客id
# card_id ... payjpのデフォルトカードid
