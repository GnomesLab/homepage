class Post < ActiveRecord::Base
  # Included behavior
  include ArchiveTree
  acts_as_taggable_on :tags

  # Associations
  belongs_to :user

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

  # Public class methods
  #
  # Returns the list of tags (+ActsAsTaggableOn::Tag+) associated with the Post model.
  #
  # Default behavior
  #   * Returns an array of +ActsAsTaggableOn::Tag+
  #   * The default tag count limit is 40
  #
  # Generic example:
  #   Post.tag_cloud #=> [#<ActsAsTaggableOn::Tag id: 1, name: "rails">, #<ActsAsTaggableOn::Tag id: 2, name: "ruby">]
  #
  # It also allows you to override the default limit:
  #   Post.tag_cloud(1) #=> [#<ActsAsTaggableOn::Tag id: 1, name: "rails">]
  def self.tag_cloud(limit = 40)
    Post.tag_counts_on(:tags).limit(limit)
  end

  # Public instance methods
  #
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

  # Escapes the Post#body into an HTML safe representation, blocking all sorts of injections.
  #
  # Example
  #   p = Post.find.first
  #   p.body = "<a href='http://google.com'>google</a>"
  #   p.html_safe_body #=> "&gt;a..."
  def html_safe_body
    safe_body = RedCloth.new(body)
    safe_body.filter_html = true
    safe_body.to_html
  end
end
