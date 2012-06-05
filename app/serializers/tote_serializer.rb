class ToteSerializer < ActiveModel::Serializer

  attributes :id, :owner, :owner_comments, :customer_comments, :created_at
  has_one :requestor
  has_many :documents
end
