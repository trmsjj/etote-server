class Requestor < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :totes, :through => :document_requests

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true, :email_format => true
end