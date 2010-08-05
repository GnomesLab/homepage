class Category < ActiveRecord::Base
  # includes
  include FriendlyIdFinder

  # associations
  has_many :projects
  has_friendly_id :name, :use_slug => true, :approximate_ascii => true

  # validations
  validates :name, :presence => true

  # named scopes
  scope :ordered_by_name, order('name asc')

  # instance methods
  def to_param
    self.friendly_id
  end
end
