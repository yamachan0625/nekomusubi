class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  mount_uploader :image, ImageUploader

  validates :title, :address, :content, presence: true
end
