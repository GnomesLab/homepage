class Post < ActiveRecord::Base
  # Included behavior
  # include ArchiveTree

  # Associations
  belongs_to :user
  acts_as_taggable_on :tags
  
  # Validations
  validates :user, :presence => true
  validates :body, :presence => true, :length => { :minimum => 3 }
  validates :title, :presence => true, :length => { :within => 3..35 }

  # Pagination
  cattr_reader :per_page
  @@per_page = 2

  # Scopes
  scope :latest, order('id desc')
  scope :popular, lambda { |l = 5| order('views desc').limit(l) }

  # Public instance methods
  # Increments (by 1) counter that tracks the number of views of the current post instance
  #
  # Example
  #   Post.first.increment
  def increment
    self.transaction do
      self.views += 1
      self.save
    end
  end
end
