require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できない" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空では登録できない" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " nicknameが20文字以上であれば登録できない " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it " nicknameが19文字以下であれば登録できる" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "重複したemailが存在する場合登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが8文字以上あれば登録できる " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以下あれば登録できない " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it "addressが空でも登録できる " do
      user = build(:user, address: "")
      user.valid?
      expect(user).to be_valid
    end

    it "introductionが空でも登録できる " do
      user = build(:user, introduction: "")
      user.valid?
      expect(user).to be_valid
    end

  end
end