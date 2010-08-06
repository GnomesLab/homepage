class Project < ActiveRecord::Base
  # includes
  include FriendlyIdFinder

  # associations
  has_many :images
  belongs_to :category, :counter_cache => true
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true

  # validations
  validates :title,    :presence => true
  validates :subtitle, :presence => true
  validates :date,     :presence => true
  validates :category, :presence => true, :associated => true

  # pagination
  cattr_reader :per_page
  @@per_page = 5

  # named scopes
  scope :reverse, order('date desc')

  # instance methods
  def default_image
    self.images.default.first || self.images.first
  end

  def previews
    return [] if self.images.blank?
    self.images - [default_image]
  end

  def to_param
    self.friendly_id
  end
end
