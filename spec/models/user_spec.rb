require 'spec_helper'

context User do

  subject { Factory.build(:user) }

  describe "validations" do

    it "recognises valid input data" do
      subject.should be_valid
    end

    describe "name" do
      it "defines name as a required attribute" do
        subject.name = nil
        subject.should_not be_valid
      end

      it "doesn't support two small names" do
        subject.name = "Pe Co"
        subject.should_not be_valid
      end

      it "doesn't support one big name" do
        subject.name = "PedroCoutinho"
        subject.should_not be_valid
      end
    end # name

    describe "devise" do
      it "enforces devise standard validations" do
        subject.email = nil
        subject.password = "123"

        subject.should_not be_valid
        subject.errors[:email].should_not be_nil
        subject.errors[:password].should_not be_nil
      end
    end #devise

  end # Validations

end
