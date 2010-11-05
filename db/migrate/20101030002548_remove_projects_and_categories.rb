# encoding: UTF-8

class RemoveProjectsAndCategories < ActiveRecord::Migration
  def self.up
    drop_table :categories
    drop_table :projects
    drop_table :images
  end

  def self.down
    create_table "categories", :force => true do |t|
      t.string   "name",                          :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "projects_count", :default => 0, :null => false
    end
    
    add_index "categories", ["projects_count"], :name => "index_categories_on_projects_count"
    
    create_table "images", :force => true do |t|
      t.string   "title",                         :null => false
      t.text     "url",                           :null => false
      t.integer  "project_id",                    :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "is_default", :default => false
    end
    
    create_table "projects", :force => true do |t|
      t.string   "title",       :null => false
      t.string   "subtitle",    :null => false
      t.date     "date",        :null => false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "category_id", :null => false
      t.text     "description", :null => false
      t.string   "url",         :null => false
    end

    add_index "projects", ["category_id"], :name => "index_projects_on_category_id"
  end
end
