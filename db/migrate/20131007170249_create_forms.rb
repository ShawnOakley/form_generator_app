class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :owner_id, null: false
      t.string :form_name, null: false
      t.text :description, null: false


      t.timestamps
    end

    add_index :forms, :owner_id
  end
end
