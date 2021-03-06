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

ActiveRecord::Schema.define(:version => 20130519121751) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "cif"
    t.string   "sec_social_number"
    t.string   "street"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
  end

  create_table "contribution_groups", :force => true do |t|
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "number"
    t.string   "professional_category"
    t.decimal  "min_base_salary"
    t.decimal  "max_base_salary"
  end

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "nif"
    t.string   "sec_social_number"
    t.integer  "company_id"
    t.integer  "contribution_group_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "payrolls", :force => true do |t|
    t.decimal  "salary"
    t.decimal  "bonus"
    t.decimal  "overtime"
    t.decimal  "salary_bonus"
    t.decimal  "payment_in_kind"
    t.decimal  "no_bonuses"
    t.decimal  "irpf"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "employee_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "agreement"
    t.integer  "payment"
    t.decimal  "overtime_fm"
    t.decimal  "indemnification"
    t.decimal  "indemnification_sec_social"
    t.decimal  "indemnification_for_transfer"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_foreign_key "companies", "users", :name => "companies_user_id_fk"

  add_foreign_key "employees", "companies", :name => "employees_company_id_fk"
  add_foreign_key "employees", "contribution_groups", :name => "employees_contribution_group_id_fk"

  add_foreign_key "payrolls", "employees", :name => "payrolls_employee_id_fk"

end
