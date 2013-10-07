class Form < ActiveRecord::Base
  attr_accessible :owner_id, :form_name, :description, :target_url

  validates_presence_of :owner_id, :form_name, :description, :target_url

  belongs_to(
  :user,
  foreign_key: :owner_id,
  primary_key: :id)

  has_many(
  :entries,
  foreign_key: :form_id,
  primary_key: :id)
end