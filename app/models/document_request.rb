class DocumentRequest < ActiveRecord::Base
  belongs_to :requestor
  belongs_to :document
  validates :document, :requestor, :presence => true
end