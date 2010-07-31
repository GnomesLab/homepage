class Category < ActiveRecord::Base
  # associations
  has_many :projects

  # attributes
  attr_readonly :count_of_projects

  # validations
  validates :name, :presence => true

  # named scopes
  scope :ordered_by_name, order('name asc')

  # instance methods
  def to_param
    "#{self.name.to_url}"
  end
end
