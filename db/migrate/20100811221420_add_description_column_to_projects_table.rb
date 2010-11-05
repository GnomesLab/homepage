# encoding: UTF-8

class AddDescriptionColumnToProjectsTable < ActiveRecord::Migration
  def self.up
    add_column :projects, :description, :text, :null => false
  end

  def self.down
    remove_column :projects, :description
  end
end