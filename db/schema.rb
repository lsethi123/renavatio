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

ActiveRecord::Schema.define(:version => 20130825165903) do

  create_table "accounts", :force => true do |t|
    t.string   "organization"
    t.text     "address1"
    t.text     "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone"
    t.string   "country"
    t.string   "fax"
    t.string   "tax_identifier"
    t.string   "primary_website"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthday"
    t.text     "address"
    t.integer  "age"
    t.integer  "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "patients", ["account_id"], :name => "index_patients_on_account_id"

  create_table "staffs", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "title"
    t.boolean  "administrator"
    t.integer  "account_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "staffs", ["account_id"], :name => "index_staffs_on_account_id"

  create_table "visits", :force => true do |t|
    t.integer  "type_of"
    t.text     "chief_complaint"
    t.text     "plan"
    t.text     "assessment"
    t.date     "date_of"
    t.integer  "patient_id"
    t.integer  "staff_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "visits", ["patient_id"], :name => "index_visits_on_patient_id"
  add_index "visits", ["staff_id"], :name => "index_visits_on_staff_id"

  create_table "vital_signs", :force => true do |t|
    t.decimal  "height"
    t.decimal  "weight"
    t.integer  "bp1"
    t.integer  "bp2"
    t.decimal  "temperature"
    t.integer  "pulse"
    t.integer  "respiratory_rate"
    t.integer  "visit_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "vital_signs", ["visit_id"], :name => "index_vital_signs_on_visit_id"

end
