class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode


  mount_uploader :image, ImageUploader

  validates :title, :content, :address, :image, presence: true

  def self.search(search)
    return Post.all unless search
    Post.where(['address LIKE ?', "%#{search}%"])
  end

end
