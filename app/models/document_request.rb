class DocumentRequest < ActiveRecord::Base
  belongs_to :tote
  belongs_to :document
  validates :document, :tote, :presence => true
end