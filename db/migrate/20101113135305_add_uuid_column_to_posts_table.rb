class AddUuidColumnToPostsTable < ActiveRecord::Migration
  def self.up
    add_column :posts, :uuid, :string, :null => true
  end

  def self.down
    remove_column :posts, :uuid
  end
end