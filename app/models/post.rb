class Post < ApplicationRecord
  belongs_to :user

  validates :title, :address, :content, presence: true
end
