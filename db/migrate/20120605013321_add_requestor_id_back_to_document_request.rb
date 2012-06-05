class AddRequestorIdBackToDocumentRequest < ActiveRecord::Migration
  def change
    change_table :document_requests do |t|
      t.belongs_to :requestor
    end
  end
end
