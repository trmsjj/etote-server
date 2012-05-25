class DocumentRequest < ActiveRecord::Base
  attr_accessible :file_name
  belongs_to :requestor
  validates :file_name, :requestor, :presence => true
end