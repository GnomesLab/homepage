class AddIndexToCategoriesCounter < ActiveRecord::Migration
  def self.up
    add_index :categories, :count_of_projects
  end

  def self.down
    remove_index :categories, :count_of_projects
  end
end