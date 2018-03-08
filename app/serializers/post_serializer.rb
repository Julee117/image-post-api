class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :content, :likes

  has_many :comments
end
