# encoding: UTF-8

class Comment < ActiveRecord::Base
  # Associations
  belongs_to :parent, :class_name => 'Comment'
  belongs_to :post

  # Validations
  validates :name,  :presence => true, :length => { :within => 2..16 }
  validates :body,  :presence => true, :length => { :within => 2..3000 }

  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } #DELETE THIS!

  validates :url,   :format => URI::regexp(%w(http https)),
                    :allow_nil => true

  validates :post,  :presence => true,
                    :associated => true

  validate :validate_post, :validate_tree

  # Scopes
  scope :root,    where('parent_id IS NULL')
  scope :child,   lambda { |p| where('parent_id = ?', p.id) }
  scope :visible, where('visible = ?', true)
  scope :recent,  lambda { |n = 5| root.visible.limit(n).order('created_at DESC') }

  # Accessor
  def url=(value)
    value = nil if value.blank?
    self[:url] = value.nil? || value =~ /^(?:(\S+))\:\/\// ? value : "http://#{value}"
  end

  # Protected instance methods
  protected
    def validate_post
      return if post.nil? || parent.nil?
      errors.add(:post, 'must be the same as the parent comment') unless post == parent.post
    end

    def validate_tree
      return if self.parent.nil?
      errors.add(:parent, 'must be a root comment') unless parent.parent.nil?
    end
end