class CreateEnquiries < ActiveRecord::Migration
  def self.up
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

  def self.down
    drop_table :enquiries
  end
end
