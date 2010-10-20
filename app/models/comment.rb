class Comment < ActiveRecord::Base
  # associations
  belongs_to :parent, :class_name => 'Comment'
  belongs_to :post

  # validations
  validates :name,  :presence => true, :length => { :within => 2..16 }
  validates :body,  :presence => true, :length => { :within => 2..3000 }

  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i } #DELETE THIS!

  validates :url,   :format => URI::regexp(%w(http https)),
                    :allow_nil => true

  validates :post,  :presence => true,
                    :associated => true

  validate :validate_parent_post, :validate_parent_tree

  # scopes
  scope :first_level, where('parent_id IS NULL')
  scope :second_level, lambda { |p| where('parent_id = ?', p.id) }
  scope :visible, where('visible = ?', true)

  # accessor
  def url=(value)
    self[:url] = value =~ /^(?:(\S+))\:\/\// ? value : "http://#{value}"
  end

  # protected instance methods
  protected
    def validate_parent_post
      return if self.post.nil? || self.parent.nil?
      self.errors.add(:post, 'self and parent must belong to the same post') unless self.post == self.parent.post
    end

    def validate_parent_tree
      return if self.parent.nil?
      self.errors.add(:parent, 'parent can\'t be a child') unless self.parent.parent.nil?
    end
end