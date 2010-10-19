class AddPostReferenceToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :post_id, :integer
    add_index :comments, :post_id
  end

  def self.down
    remove_column :comments, :post_id
  end
end
