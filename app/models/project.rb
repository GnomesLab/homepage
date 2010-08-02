class Project < ActiveRecord::Base
  # associations
  belongs_to :category, :counter_cache => true
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true

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

  # instance methods
  def to_param
    "#{self.id}-#{self.title.to_url}"
  end
end
