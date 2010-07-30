class Project < ActiveRecord::Base
  # associations
  belongs_to :category

  # validations
  validates :title,    :presence => true
  validates :subtitle, :presence => true
  validates :image,    :presence => true
  validates :date,     :presence => true
  validates :category, :presence => true, :associated => true

  # pagination
  cattr_reader :per_page
  @@per_page = 5

  # named scopes
  scope :reverse, order('date desc')
end
