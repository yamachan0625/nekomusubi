class Post < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  # validates :title, :address, :content, presence: true
end
