class AddDocumentIdToDocumentRequest < ActiveRecord::Migration
  def change
    change_table :document_requests do |t|
      t.remove :file_name
      t.belongs_to :document
      t.index :document_id
    end
  end
end
