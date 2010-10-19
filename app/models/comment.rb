class Comment < ActiveRecord::Base
  # associations
  belongs_to :parent, :class_name => 'Comment'
  belongs_to :post, :counter_cache => true

  # validations
  validates :name,  :presence => true
  validates :body,  :presence => true

  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  validates :url,   :format => URI::regexp(%w(http https)),
                    :allow_nil => true

  validates :post,  :presence => true,
                    :associated => true

  # callbacks
  validate :validate_parent_post, :validate_parent_tree

  # instance methods
  def url=(value)
    unless value.nil? || value =~ /^(?:(\S+))\:\/\//
      value = "http://#{value}"
    end

    self[:url] = value
  end

  protected
    def validate_parent_post
      return if self.post.nil? || self.parent.nil?
      self.errors.add(:post, 'self and parent must belong to the same post') unless self.post.eql?(self.parent.post)
    end

    def validate_parent_tree
      return if self.parent.nil?
      self.errors.add(:parent, 'parent can\'t be a child') unless self.parent.parent.nil?
    end
end