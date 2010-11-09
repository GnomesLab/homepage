# encoding: UTF-8

class Post < ActiveRecord::Base

  # Included behavior
  include FriendlyIdFinder

  acts_as_archive :published_at
  acts_as_taggable_on :tags

  # Associations
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true

  # Validations
  validates :user,  :presence => true
  validates :body,  :presence => true, :length => { :minimum => 3 }
  validates :title, :presence => true, :length => { :within => 3..35 }

  # Attribute accessibility
  attr_accessible :user_id, :title, :body, :tag_list, :published_at

  # Pagination
  cattr_reader :per_page
  @@per_page = 2

  # Scopes
  scope :latest,    order('published_at DESC')
  scope :published, where('published_at IS NOT NULL')
  scope :popular,   lambda { |l = 5| published.order('views DESC').limit(l) }
  scope :recent,    lambda { |l = 5| published.latest.limit(l) }

  # Public class methods
  #
  # Returns the list of tags (ActsAsTaggableOn::Tag) associated with the Post model.
  #
  # Default behavior
  #   * Returns an array of ActsAsTaggableOn::Tag
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
  
  # Returns the root comments.
  # Accepts a boolean to filter hidden comments.
  def root_comments(all = false)
    all ? self.comments.root : self.comments.root.visible
  end

  # Returns the child comments for a given parent comment.
  # Accepts a boolean to filter hidden comments.
  def child_comments(parent, all = false)
    all ? self.comments.child(parent) : self.comments.child(parent).visible
  end

  # returns up to 5 related posts
  #
  # this method relies on the scope :popular which depends on the method increment to work.
  #
  # View example: (on related posts partial)
  #   <%  post.related %>
  def related(limit = 5)
    self.find_related_tags.popular(limit)
  end # end related (posts)

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

  # Publishes a new or existing record.
  #
  # Default behavior:
  # * If the record is a new record it will save it and then publish it
  # * This method is not destructhive, thus it _always_ returns true or false and never an exception
  # * Records that have already been published will _not_ re-published. In such cases +true+ will be returned
  #
  # Example:
  #  Post.first.publish #=> true
  def publish
    return true if self.published_at

    if self.new_record?
      return false unless self.save
    end

    self.published_at = Time.now
    self.save
  end

  # Returns true or false, depending if the record has already been published or not.
  #
  # Example
  #  post = Post.first.publish
  #  post.published? #=> true
  def published?
    self.published_at.present?
  end

end # Post
