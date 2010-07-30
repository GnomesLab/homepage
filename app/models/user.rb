class User < ActiveRecord::Base
  
  has_many :posts
  
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Protect all attributes
  attr_protected :id, :encrypted_password, :password_salt, :reset_password_token,
                      :remember_token, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
                      :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :name

  # validations
  validates :name, :presence => true, :format => { :with => /\A([a-zA-Z]+{3,10})\s([a-zA-Z]+{3,10})\z/i,
                                                   :allow_blank => false,
                                                   :allow_nil => false }

  public :sanitize_for_mass_assignment
end
