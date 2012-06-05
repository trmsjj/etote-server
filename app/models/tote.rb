class Tote < ActiveRecord::Base
	attr_accessible :owner, :customer_comments, :owner_comments

	belongs_to :requestor
	has_many :documents, :through => :document_requests

	validates :requestor, :presence => true
end