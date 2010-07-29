require 'spec_helper'

context Enquiry do

  subject { Factory.build(:enquiry) }

  describe "validations" do
    it "must have a name" do
      subject.name = nil
      subject.should_not be_valid
    end

    it "must have a email" do
      subject.email = nil
      subject.should_not be_valid
    end

    it "must have a message" do
      subject.message = nil
      subject.should_not be_valid
    end

    it "may not have company" do
      subject.company = nil
      subject.should be_valid
    end

    it "may not have a phone number" do
      subject.phone_number = nil
      subject.should be_valid
    end

    it "should be valid with all the properties set" do
      subject.should be_valid
    end
  end # Validations

end
