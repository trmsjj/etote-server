class RequestorSerializer < ActiveModel::Serializer
  attributes :name, :email

  private
   def attributes
     hash = super
     hash.merge!(:documents => requestor.document_file_names)
     hash
   end
end
