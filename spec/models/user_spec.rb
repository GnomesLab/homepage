require 'spec_helper'

describe User do
  
  subject { Factory.build(:user) }
  
  it "must accept a valid name" do
    subject.name = "Pedro Coutinho"
    subject.should be_valid
  end
  
  it "it must not let 2 small names pass" do
    subject.name = "Pe Co"
    subject.should_not be_valid
  end
  
  it "it must not let 1 big name pass" do
    subject.name = "PedroCoutinho"
    subject.should_not be_valid
  end
  
  it "must have a name" do
    subject.name = nil
    subject.should_not be_valid
  end
  
  it "must accept a valid email" do
    subject.email = "pdcoutinho@gmail.com"
    subject.should be_valid
  end
  
  it "must have an email" do
    subject.email = nil
    subject.should_not be_valid
  end
  
  it "must have a valid email" do
    subject.email = "invalid email"
    subject.should_not be_valid
  end
  
  it "must must accept a valid password" do
    subject.password = "123456"
    subject.should be_valid
  end
  
  it "must have a password" do
    subject.password = nil
    subject.should_not be_valid
  end
  
  it "password must be greater than 5 digits" do
    subject.password = "123"
    subject.should_not be_valid
  end

  
end