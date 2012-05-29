class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :documents

  validates :name, :presence => true
end
