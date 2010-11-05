# encoding: UTF-8

class AddCommentsCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :comments_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :posts, :comments_count
  end
end
