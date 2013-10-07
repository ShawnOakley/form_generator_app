class Entry < ActiveRecord::Base
  attr_accessible :form_id, :type ,:name ,:id ,:accept ,:align ,:alt ,:autocomplete ,:disabled ,:formaction ,:formenctype ,:formmethod ,:formnovalidate ,:formtarget ,:height ,:list ,:max ,:min ,:pattern ,:placeholder ,:randomly ,:required ,:size ,:src ,:step ,:width ,:parsed_input

  validates_presence_of :form_id, :type
end
