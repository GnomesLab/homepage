class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true
  validates :content, :presence => true
end