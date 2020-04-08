require 'rails_helper'
describe Address do
  describe "#createアクションのテスト" do
    describe '各項目が空では登録できないこと' do
      it "is invalid without a last_name" do
        address = build(:address, last_name: "")
        address.valid?
        expect(address.errors[:last_name]).to include("を入力してください")
      end

      it "is invalid without a first_name" do
        address = build(:address, first_name: "")
        address.valid?
        expect(address.errors[:first_name]).to include("を入力してください")
      end

      it "is invalid without a last_name_jp" do
        address = build(:address, last_name_jp: "")
        address.valid?
        expect(address.errors[:last_name_jp]).to include("を入力してください")
      end

      it "is invalid without a first_name_jp" do
        address = build(:address, first_name_jp: "")
        address.valid?
        expect(address.errors[:first_name_jp]).to include("を入力してください")
      end

      it "is invalid without a postal_code" do
        address = build(:address, postal_code: "")
        address.valid?
        expect(address.errors[:postal_code]).to include("を入力してください")
      end

      it "is invalid without a city" do
        address = build(:address, city: "")
        address.valid?
        expect(address.errors[:city]).to include("を入力してください")
      end

      it "is invalid without a house_number" do
        address = build(:address, house_number: "")
        address.valid?
        expect(address.errors[:house_number]).to include("を入力してください")
      end
    end

    describe 'last_name_jp、first_name_jpが全角カナ以外では登録できないこと' do
      it "is invalid with a last_name_jp that has in Half-width kana" do
        address = build(:address, last_name_jp: "ﾔﾏﾀﾞ")
        address.valid?
        expect(address.errors[:last_name_jp]).to include("は不正な値です")
      end

      it "is invalid with a first_name_jp that has in Half-width kana" do
        address = build(:address, first_name_jp: "ﾀﾛｳ")
        address.valid?
        expect(address.errors[:first_name_jp]).to include("は不正な値です")
      end

      it "is invalid with a last_name_jp that has in English" do
        address = build(:address, last_name_jp: "yamada")
        address.valid?
        expect(address.errors[:last_name_jp]).to include("は不正な値です")
      end

      it "is invalid with a first_name_jp that has in English" do
        address = build(:address, first_name_jp: "taro")
        address.valid?
        expect(address.errors[:first_name_jp]).to include("は不正な値です")
      end

      it "is invalid with a last_name_jp that is a number" do
        address = build(:address, last_name_jp: "0")
        address.valid?
        expect(address.errors[:last_name_jp]).to include("は不正な値です")
      end

      it "is invalid with a first_name_jp that is a number" do
        address = build(:address, first_name_jp: "o")
        address.valid?
        expect(address.errors[:first_name_jp]).to include("は不正な値です")
      end
    end

    describe 'postal_codeの文字と文字数制限のテスト' do
      it "is invalid with a postal_code that has more than 8 characters" do
        address = build(:address, postal_code: "11111111")
        address.valid?
        expect(address.errors[:postal_code]).to include("は7文字で入力してください")
      end

      it "is invalid with a postal_code that has less than 6 characters" do
        address = build(:address, postal_code: "111111")
        address.valid?
        expect(address.errors[:postal_code]).to include("は7文字で入力してください")
      end

      it "is invalid with a postal_code that has in English" do
        address = build(:address, postal_code: "aaaaaaa")
        address.valid?
        expect(address.errors[:postal_code]).to include("は不正な値です")
      end
    end

    describe 'phone_numberのテスト' do
      it "is invalid with a phone_number that leading character is not 0" do
        address = build(:address, phone_number: "19011112222")
        address.valid?
        expect(address.errors[:phone_number]).to include("は不正な値です")
      end

      it "is invalid with a phone_number that has more than 12 characters" do
        address = build(:address, phone_number: "090111122223")
        address.valid?
        expect(address.errors[:phone_number]).to include("は不正な値です")
      end

      it "is invalid with a phone_number that has less than 9 characters" do
        address = build(:address, phone_number: "090111122")
        address.valid?
        expect(address.errors[:phone_number]).to include("は不正な値です")
      end

      it "is valid with a phone_number that leading character is 0 and has 10 characters" do
        address = build(:address, phone_number: "0901111222")
        expect(address).to be_valid
      end

      it "is valid with a phone_number that leading character is 0 and has 11 characters" do
        address = build(:address, phone_number: "09011112222")
        expect(address).to be_valid
      end
    end

    describe 'saveできる時のテスト' do
      it "is valid with a postal_code, prefectures, city, house_number" do
        address = build(:address)
        expect(address).to be_valid
      end
    end

  end
end