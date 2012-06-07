class CategorySerializer < ActiveModel::Serializer
  attributes :name, :image_url
  has_many :documents
end
