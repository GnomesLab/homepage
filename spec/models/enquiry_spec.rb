require 'spec_helper'

describe Enquiry do

  subject { Factory.build(:enquiry) }

  describe "validations" do

    it "should be valid with all the properties set" do
      subject.should be_valid
    end

    describe "name" do
      it "is a required attribute" do
        subject.name = nil
        subject.should_not be_valid
        subject.errors.should include :name
      end
    end # name

    describe "email" do
      it "must have a email" do
        subject.email = nil
        subject.should_not be_valid
        subject.errors.should include :email
      end

      it "does not allow invalid email addresses" do
        subject.email = 'crippled@email'
        subject.should_not be_valid
        subject.errors.should include :email
      end
    end # email

    describe "message" do
      it "is a required attribute" do
        subject.message = nil
        subject.should_not be_valid
        subject.errors.should include :message
      end

      it "has a minimum lenght of 3 characters" do
        subject.message = 'o/'
        subject.should_not be_valid
        subject.errors.should include :message
      end
    end # message

    describe "company" do
      it "is not a required attribute" do
        subject.company = nil
        subject.should be_valid
        subject.errors.should_not include :company
      end
    end # company

    describe "phone number" do
      it "is not a required attribute" do
        subject.phone_number = nil
        subject.should be_valid
        subject.errors.should_not include :phone_number
      end
    end # phone number

  end # Validations

end
