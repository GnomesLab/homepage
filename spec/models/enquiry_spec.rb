require 'spec_helper'

describe Enquiry do

  subject {
    returning Enquiry.new do |e|
      e.name         = 'Client Name'
      e.email        = 'mail@company.com'
      e.message      = 'Gnomeslab is amazing'
      e.company      = 'company'
      e.phone_number = '919999999'
    end
  }

  describe "properties" do
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

    it "should be valid it all the properties" do
      subject.should be_valid
    end
  end
end
