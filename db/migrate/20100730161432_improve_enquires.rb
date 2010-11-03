# encoding: UTF-8

class ImproveEnquires < ActiveRecord::Migration
  def self.up
    drop_table :enquiries

    create_table :enquiries do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :company
      t.string :phone_number
      t.text :message, :null => false

      t.timestamps
    end

    add_index :enquiries, :email
  end

  def self.down
    drop_table :enquiries

    create_table :enquiries do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :phone_number
      t.text :message

      t.timestamps
    end

    add_index :enquiries, :email
  end
end
