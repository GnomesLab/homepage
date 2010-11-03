# encoding: UTF-8

class AddNotNullConstraintToCategoryIdColumnInProjectsTable < ActiveRecord::Migration
  def self.up
    change_column :projects, :category_id, :integer, :null => false
  end

  def self.down
    change_column :projects, :category_id, :integer
  end
end