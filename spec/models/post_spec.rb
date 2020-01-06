require 'rails_helper'
describe Post do
  describe '#create' do

    it "全て空でなければ登録できる" do
      post = build(:post)
      post.valid?
      expect(build(:post)).to be_valid
    end

    it "titleが空では登録できない" do
      post = build(:post, title: "")
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "addressが空では登録できない" do
      post = build(:post, address: "")
      post.valid?
      expect(post.errors[:address]).to include("を入力してください")
    end

    it "imageが空では登録できない" do
      post = build(:post, image: "")
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end

    it "contentが空では登録できない" do
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end

    it "latitudeが空では登録できない" do
      post = build(:post, latitude: "")
      post.valid?
      expect(post.errors[:latitude]).to include("を入力してください")
    end

    it "longitudeが空では登録できない" do
      post = build(:post, longitude: "")
      post.valid?
      expect(post.errors[:longitude]).to include("を入力してください")
    end

    it "user_idが空では登録できない" do
      post = build(:post, user_id: "")
      post.valid?
      expect(post.errors[:user]).to include("を入力してください")
    end
    
  end
end