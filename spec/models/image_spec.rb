require 'spec_helper'

context Image do

  subject { Factory.build(:image) }

  describe "validations" do

    it "must be valid with all the properties set" do
      subject.should be_valid
    end

    describe "title" do
      it "is a required attribute" do
        subject.title = nil
        subject.should_not be_valid
        subject.errors.should include :title
      end
    end # title

    describe "url" do
      it "is a required attribute" do
        subject.url = nil
        subject.should_not be_valid
        subject.errors.should include :url
      end
    end # url

    describe "project" do
      it "is a required attribute" do
        subject.project = nil
        subject.should_not be_valid
        subject.errors.should include :project
      end
    end # project

  end # validations
end
