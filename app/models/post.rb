class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode


  mount_uploader :image, ImageUploader

  validates :title, :content, :address, :image, :latitude, :longitude, presence: true

  def self.search(search)
    return Post.all unless search
    Post.where(['address LIKE ?', "%#{search}%"])
  end

  def dangerous
    Time.current > created_at + 1.week
  end

end
