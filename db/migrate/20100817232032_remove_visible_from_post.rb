class RemoveVisibleFromPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :visible
  end

  def self.down
    add_column :posts, :visible, :boolean, :default => false, :null => false
    add_index :posts, :visible
  end
end