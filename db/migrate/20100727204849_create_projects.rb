class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title, :null => false
      t.string :subtitle, :null => false
      t.text :image, :null => false
      t.date :date, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
