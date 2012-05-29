class Requestor < ActiveRecord::Base
  attr_accessible :name, :email

  has_many :document_requests, :dependent => :destroy
  has_many :documents, :through => :document_requests

  validates :name, :email, :presence => true
  validates :email, :uniqueness => true, :email_format => true
end