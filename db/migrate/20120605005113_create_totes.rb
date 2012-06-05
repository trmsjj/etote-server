class CreateTotes < ActiveRecord::Migration
  def change
    create_table :totes do |t|
      t.string :owner
      t.string :owner_comments
      t.string :customer_comments
      t.belongs_to :requestor

      t.timestamps
    end
    add_index :totes, :tote_id
  end
end
