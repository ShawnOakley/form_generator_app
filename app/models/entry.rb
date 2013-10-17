class Entry < ActiveRecord::Base
  attr_accessible :form_id,
                  :input_tag_type,
                  :name,
                  :id,
                  :height,
                  :list,
                  :max,
                  :min,
                  :pattern,
                  :placeholder,
                  :randomly,
                  :required,
                  :size,
                  :src,
                  :step,
                  :width,
                  :parsed_input,
                  :label,
                  :placeholder,
                  :klass,
                  :instructions,
                  :collection,
                  :display_rows,
                  :prompt



  serialize :collection

  validates_presence_of :form_id, :input_tag_type, :label

  belongs_to(
  :form,
  foreign_key: :form_id,
  primary_key: :id)

end
