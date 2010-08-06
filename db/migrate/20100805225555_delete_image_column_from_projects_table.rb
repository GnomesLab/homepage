class DeleteImageColumnFromProjectsTable < ActiveRecord::Migration
  def self.up
    remove_column :projects, :image
  end

  def self.down
    add_column :projects, :image, :text, :null => false
  end
end
