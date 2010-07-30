class Post < ActiveRecord::Base
  
  belongs_to :user
  
  # validations
  validates :user, :presence => true
  validates :body, :presence => true, :length => { :minimum => 3 }
  validates :title, :presence => true, :length => { :within => 3..35 }
  
  # pagination
  cattr_reader :per_page
  @@per_page = 2
  
  # named scopes
  scope :reverse, order('created_at desc')
  
  def increment
    self.transaction do
      self.views += 1
      self.save
    end
  end
end