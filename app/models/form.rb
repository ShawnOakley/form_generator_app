class Form < ActiveRecord::Base
  attr_accessible :owner_id, :form_name, :title, :captcha

  validates_presence_of :owner_id, :form_name, :title, :captcha
end
