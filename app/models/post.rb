class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }


  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true
end
