require 'rails_helper'
describe Message do
  describe '#create' do

    it "全て空でなければ登録できる" do
      message = build(:message)
      message.valid?
      expect(build(:message)).to be_valid
    end

    it "messageが空では登録できない" do
      message = build(:message, message: "")
      message.valid?
      expect(message.errors[:message]).to include("を入力してください")
    end

    it "room_idが空では登録できない" do
      message = build(:message, room_id: nil)
      message.valid?
      expect(message.errors[:room]).to include("を入力してください")
    end

    it "user_idが空では登録できない" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("を入力してください")
    end
    
  end
end