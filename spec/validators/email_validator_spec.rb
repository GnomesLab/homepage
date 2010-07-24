require 'spec_helper'

class EmailValidatorTester
  include ActiveModel::Validations

  attr_accessor :email

  validates :email, :email => true
  
  def initialize(value)
    self.email = value
  end
end

describe EmailValidator do
  it "should recognise a valid address" do
    pending "ruby 1.9.2 utf 8 encoding"
    # tester = EmailValidatorTester.new('mail@gnomeslab.com')
    # tester.should be_valid
  end
end
