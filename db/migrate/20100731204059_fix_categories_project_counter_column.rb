class FixCategoriesProjectCounterColumn < ActiveRecord::Migration
  def self.up
    remove_column :categories, :count_of_projects
    add_column :categories, :projects_count, :integer, :default => 0, :null => false
    add_index :categories, :projects_count
  end

  def self.down
    remove_column :categories, :projects_count
    add_column :categories, :count_of_projects, :integer
    add_index :categories, :count_of_projects
  end
end