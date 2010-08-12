class AddUrlColumnToProjectsTable < ActiveRecord::Migration
  def self.up
    add_column :projects, :url, :string, :null => false
  end

  def self.down
    remove_column :projects, :url
  end
end