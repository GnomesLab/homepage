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

ActiveRecord::Schema.define(:version => 20100731204059) do

  create_table "categories", :force => true do |t|
    t.string   "name",                          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "projects_count", :default => 0, :null => false
  end

  add_index "categories", ["projects_count"], :name => "index_categories_on_projects_count"

  create_table "enquiries", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "email",        :null => false
    t.string   "company"
    t.string   "phone_number"
    t.text     "message",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enquiries", ["email"], :name => "index_enquiries_on_email"

  create_table "posts", :force => true do |t|
    t.string   "title",                         :null => false
    t.integer  "user_id",                       :null => false
    t.text     "body",                          :null => false
    t.boolean  "visible",    :default => false
    t.integer  "views",      :default => 0,     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["created_at"], :name => "index_posts_on_created_at"

  create_table "projects", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "subtitle",    :null => false
    t.text     "image",       :null => false
    t.date     "date",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id", :null => false
  end

  add_index "projects", ["category_id"], :name => "index_projects_on_category_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
