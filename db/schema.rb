# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131007170335) do

  create_table "entries", :force => true do |t|
    t.integer  "form_id",        :null => false
    t.string   "type",           :null => false
    t.string   "name"
    t.string   "accept"
    t.string   "align"
    t.string   "alt"
    t.string   "autocomplete"
    t.string   "disabled"
    t.string   "formaction"
    t.string   "formenctype"
    t.string   "formmethod"
    t.string   "formnovalidate"
    t.string   "formtarget"
    t.string   "height"
    t.string   "list"
    t.string   "max"
    t.string   "min"
    t.string   "pattern"
    t.string   "placeholder"
    t.string   "randomly"
    t.string   "required"
    t.string   "size"
    t.string   "src"
    t.string   "step"
    t.string   "width"
    t.text     "parsed_input"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "entries", ["form_id"], :name => "index_entries_on_form_id"

  create_table "forms", :force => true do |t|
    t.integer  "owner_id",    :null => false
    t.string   "form_name",   :null => false
    t.text     "description", :null => false
    t.string   "target_url",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "forms", ["owner_id"], :name => "index_forms_on_owner_id"
  add_index "forms", ["target_url"], :name => "index_forms_on_target_url"

  create_table "users", :force => true do |t|
    t.string   "username",      :null => false
    t.string   "user_email",    :null => false
    t.string   "session_token", :null => false
    t.string   "password_hash", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["user_email"], :name => "index_users_on_user_email", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
