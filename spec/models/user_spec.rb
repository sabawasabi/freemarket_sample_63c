require 'rails_helper'
describe User do
  describe '#createアクションのテスト' do
    describe 'not nullのテスト' do
      it "is invalid without a nickname" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid without a email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid without a last_name" do
        user = build(:user, last_name: "")
        user.valid?
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "is invalid without a first_name" do
        user = build(:user, first_name: "")
        user.valid?
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "is invalid without a last_name_jp" do
        user = build(:user, last_name_jp: "")
        user.valid?
        expect(user.errors[:last_name_jp]).to include("を入力してください")
      end

      it "is invalid without a first_name_jp" do
        user = build(:user, first_name_jp: "")
        user.valid?
        expect(user.errors[:first_name_jp]).to include("を入力してください")
      end

      it "is invalid without a birth_date" do
        user = build(:user, birth_date: "")
        user.valid?
        expect(user.errors[:birth_date]).to include("を入力してください")
      end

      describe "can save" do
        it "is valid with all columns" do
          user = build(:user)
          expect(user).to be_valid
        end
      end
    end
  end
end