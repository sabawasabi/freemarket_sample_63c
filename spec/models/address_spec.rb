require 'rails_helper'
describe Address do
  describe "#createアクションのテスト" do

    describe 'postal_codeが空では登録できないこと' do
      it "is invalid without a postal_code" do
        address = build(:address, postal_code: "")
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end
    end

    describe 'saveできる時のテスト' do
      it "is invalid without a postal_code, prefectures, city, house_number" do
        address = build(:address)
        expect(address).to be_valid
      end
    end

  end
end