class ChangeSiteColumnToUrlOnComments < ActiveRecord::Migration
  def self.up
    rename_column :comments, :site, :url
  end

  def self.down
    rename_column :comments, :url, :site
  end
end
