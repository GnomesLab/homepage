# encoding: UTF-8

class AddPublishedAtToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :published_at, :datetime, :null => true, :default => nil
    add_index :posts, :published_at
  end

  def self.down
    remove_column :posts, :published_at
  end
end