class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :site, :null => true
      t.text :body, :null => false
      t.boolean :visible, :default => 1, :null => false
      t.references :parent, :null => true

      t.timestamps
    end

    add_index :comments, :visible
  end

  def self.down
    drop_table :comments
  end
end
