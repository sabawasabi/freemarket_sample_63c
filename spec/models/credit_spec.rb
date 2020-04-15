require 'rails_helper'
describe Credit do
  describe "#createアクションのテスト" do
    describe '各項目が空では登録できないこと' do
      it "is invalid without a costomer_id" do
        credit = build(costomer_id: "")
        credit.valid?
        expect(credit.errors[:costomer_id]).to include("can't be blank")
      end

      it "is invalid without a card" do
        credit = build(card: "")
        credit.valid?
        expect(credit.errors[:card]).to include("can't be blank")
      end
    end
  end
end


# RSpec.describe Credit, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"