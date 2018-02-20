class Post < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :content, presence: true
end
