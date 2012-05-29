class Document < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :url
end
