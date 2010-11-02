require "spec_helper"

describe EnquiryMailer do

  describe "contact email" do

    before(:each) do
      @enquiry = Factory.build(:enquiry)
      @email   = EnquiryMailer.contact(@enquiry).deliver

      ActionMailer::Base.deliveries.should_not be_empty
    end

    it "must be sent from the user email" do
      @email.from.should include @enquiry.email
    end

    it "must have the user name in the subject" do
      @email.subject.should include @enquiry.name
    end

    it "must contains all the fields in the email body" do
      @email.body.should include @enquiry.name
      @email.body.should include @enquiry.email
      @email.body.should include @enquiry.message
      @email.body.should include @enquiry.company
      @email.body.should include @enquiry.phone_number
    end

    it "the email must be sent only to Gnomeslab Google Group" do
      @email.should have(1).to
      @email.to.first.should include 'mail@gnomeslab.com'
    end

  end # contact email

end
