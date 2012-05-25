class CreateRequestors < ActiveRecord::Migration
  def change
    create_table :requestors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index(:requestors, :email, :unique => true)
  end
end
