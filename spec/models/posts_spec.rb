require 'spec_helper'

context Post do

  subject { Factory.build(:post) }

  describe "associations" do
    it "belongs to a user" do
      subject.user.should be_a_kind_of User
      subject.should be_valid
    end
  end

  describe "validations" do

    it "recognises valid input data" do
      subject.should be_valid
    end

    describe "name" do
      it "defines user as a required attribute" do
        subject.user = nil
        subject.should_not be_valid
        subject.errors.should include :user_id
      end
    end # name
    
    describe "title" do
      it "is a required attribute" do
        subject.title = nil
        subject.should_not be_valid
        subject.errors.should include :title
      end
      
      it "has a minimum lenght" do
        subject.title = "hi"
        subject.should_not be_valid
        subject.errors.should include :title
      end
      
      it "has a maximum lenght" do
        subject.title = "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii 35 is max"
        subject.should_not be_valid
        subject.errors.should include :title
      end
    end # title

    describe "body" do
      it "is a required attribute" do
        subject.body = nil
        subject.should_not be_valid
        subject.errors.should include :body
      end
      
      it "has a minimum lenght" do
        subject.body = "ni"
        subject.should_not be_valid
        subject.errors.should include :body
      end
    end

  end # Validations

end