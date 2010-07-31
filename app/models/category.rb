class Category < ActiveRecord::Base
  # associations
  has_many :projects

  # attributes
  attr_readonly :count_of_projects

  # validations
  validates :name, :presence => true
end
