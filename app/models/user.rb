class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # default devise settings:
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_protected :name, :email, :password, :password_confirmation, :remember_me
  
  # validations
  # validates :name, :presence => true, :format => /\A([a-zA-Z]+{3,10})\s([a-zA-Z]+{3,10})\z/i
  validates_format_of :name, :with => /\A([a-zA-Z]+{3,10})\s([a-zA-Z]+{3,10})\z/i, :on => :create
end