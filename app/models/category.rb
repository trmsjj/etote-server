class Category < ActiveRecord::Base
  attr_accessible :name, :image_url
  has_many :documents

  validates :name, :presence => true
end
