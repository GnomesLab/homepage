class Category < ActiveRecord::Base
  # associations
  has_many :projects
  
  # validations
  validates :name, :presence => true
end
