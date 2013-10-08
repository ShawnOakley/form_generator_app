class Entry < ActiveRecord::Base
  attr_accessible :form_id,
                  :input_tag_type,
                  :name,
                  :accept,
                  :align,
                  :alt,
                  :autocomplete,
                  :disabled,
                  :formaction,
                  :formenctype,
                  :formmethod,
                  :formnovalidate,
                  :formtarget,
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
                  :value,
                  :instructions,
                  :collection,
                  :prompt,
                  :display_rows,
                  :klass


  serialize :collection

  validates_presence_of :form_id, :input_tag_type

  belongs_to(
  :form,
  foreign_key: :form_id,
  primary_key: :id)

end
