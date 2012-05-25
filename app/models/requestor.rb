class Requestor < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :document_requests, :dependent => :destroy
  validates :name, :email, :presence => true
  validates :email, :uniqueness => true, :email_format => true

  def document_file_names
    document_requests.map(&:file_name)
  end
end