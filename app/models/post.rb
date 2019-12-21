class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode


  mount_uploader :image, ImageUploader

  validates :title, :content, :address, :image, presence: true
end
