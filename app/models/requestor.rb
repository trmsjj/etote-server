class Requestor < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :totes
  has_many :document_requests, :through => :totes

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true, :email_format => true
end