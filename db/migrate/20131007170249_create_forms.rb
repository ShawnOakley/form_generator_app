class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :owner_id, null: false
      t.string :form_name, null: false
      t.text :description, null: false
      t.string :target_site, null: false
      t.text :header_text
      t.text :closing_text
      t.text :css_layout
      t.text :css_color
      t.text :css_support_files
      t.text :color_css
      t.text :layout_css


      t.timestamps
    end

    add_index :forms, :owner_id
    add_index :forms, :target_site
  end
end
