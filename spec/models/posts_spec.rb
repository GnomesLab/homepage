require 'spec_helper'

context Post do

  subject { Factory.build(:post) }

  describe "validations" do

    it "recognises valid input data" do
      subject.should be_valid
    end

    describe "name" do
      it "defines user as a required attribute" do
        subject.user = nil
        subject.should_not be_valid
      end
    end
    
    describe "title" do
      it "defines title as a required attribute" do
        subject.title = nil
        subject.should_not be_valid
      end
    end
    
    describe "title" do
      it "defines the body as a required attribute" do
        subject.body = nil
        subject.should_not be_valid
      end
    end
    
    describe "title" do
      it "defines body has a minimum lenght" do
        subject.body = "hi"
        subject.should_not be_valid
      end
    end
  end
end