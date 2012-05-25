class CreateDocumentRequest < ActiveRecord::Migration
  def change
    create_table :document_requests do |t|
      t.string :file_name
      t.references :requestor

      t.timestamps
    end
    add_index(:document_requests, :requestor_id)
  end
end
