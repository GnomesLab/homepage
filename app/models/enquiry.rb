class Enquiry < ActiveRecord::Base
  # validations
  validates :name,  :presence => true
  validates :email, :presence => true,
                    :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
