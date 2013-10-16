class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :form_id, null:false
      t.string :input_tag_type, null:false
      t.string :name
      t.string :id
      t.string :height
      t.string :list
      t.string :max
      t.string :min
      t.string :pattern
      t.string :placeholder
      t.string :randomly
      t.string :required
      t.string :size
      t.string :src
      t.string :step
      t.string :width
      t.text :parsed_input
      t.string :label
      t.string :placeholder
      t.string :klass
      t.string :display_rows
      t.text :collection

      t.string :instructions



      t.timestamps
    end

    add_index :entries, :form_id
  end
end
