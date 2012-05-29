class RequestorSerializer < ActiveModel::Serializer
  attributes :name, :email
  has_many :documents
end
