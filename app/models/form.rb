class Form < ActiveRecord::Base
  attr_accessible :owner_id, :form_name, :description, :target_site, :header_text, :closing_text, :layout_css, :color_css, :form_method
  attr_accessor :header_text, :closing_text
  validates_presence_of :owner_id, :form_name, :description, :target_site, :form_method

  belongs_to(
  :user,
  foreign_key: :owner_id,
  primary_key: :id)

  has_many(
  :entries,
  foreign_key: :form_id,
  primary_key: :id)
end
