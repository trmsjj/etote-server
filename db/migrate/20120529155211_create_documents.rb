class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :url
      t.belongs_to :category

      t.timestamps
    end
    add_index :documents, :category_id
  end
end
