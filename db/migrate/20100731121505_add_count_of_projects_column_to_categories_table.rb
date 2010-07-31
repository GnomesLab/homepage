class AddCountOfProjectsColumnToCategoriesTable < ActiveRecord::Migration
  def self.up
    add_column :categories, :count_of_projects, :integer
  end

  def self.down
    remove_column :categories, :count_of_projects
  end
end
