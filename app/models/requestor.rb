class Requestor < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :document_requests
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true, :email_format => true
end