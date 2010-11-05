# encoding: UTF-8

class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :title, :null => false
      t.text :url, :null => false
      t.references :project, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
