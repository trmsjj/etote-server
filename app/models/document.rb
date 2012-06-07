class Document < ActiveRecord::Base
  belongs_to :category
  has_many :document_requests

  attr_accessible :name, :url

  validates :name, :url, :category, :presence => true
end
