# encoding: UTF-8

class Enquiry < ActiveRecord::Base
  # Validations
  validates :name,    :presence => true
  validates :message, :presence => true, :length => { :minimum => 3 }
  validates :email,   :presence => true,
                      :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
