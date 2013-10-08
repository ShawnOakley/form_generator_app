class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :form_id, null:false
      t.string :input_tag_type, null:false
      t.string :name
      t.string :id
      t.string :accept
      t.string :align
      t.string :alt
      t.string :autocomplete
      t.string :disabled
      t.string :formaction
      t.string :formenctype
      t.string :formmethod
      t.string :formnovalidate
      t.string :formtarget
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
      t.string :label
      t.string :value
      t.string :klass
      t.string :prompt
      t.string :display_rows
      t.text :collection

      t.string :instructions
      t.text :parsed_input


      t.timestamps
    end

    add_index :entries, :form_id
  end
end
