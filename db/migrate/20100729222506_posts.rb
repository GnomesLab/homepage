# encoding: UTF-8

class Posts < ActiveRecord::Migration
  def self.up
    create_table(:posts, :force => true) do |t|
      t.string :title, :null => false
      t.references :user, :null => false
      t.text :body, :null => false
      t.boolean :visible, :default => false
      t.integer :views, :null => false, :default => 0

      t.timestamps
    end

  add_index :posts, :created_at, :null => false

  end
  def self.down
    drop_table :posts
  end
end