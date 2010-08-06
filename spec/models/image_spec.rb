require 'spec_helper'

context Image do

  subject { Factory.build(:image) }

  describe "associations" do
    
    it "belongs to a project" do
      subject.project.should be_a_kind_of Project
    end
    
  end # associations

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

    describe "is_default" do
      it "must be only one per project" do
        subject.save

        3.times do
          Factory.create(:image, :project => subject.project, :is_default => true)
          Factory.create(:image, :is_default => true)
        end

        Image.where('project_id = ?', subject.project.id).default.count.should == 1
        Image.default.count.should == 4
      end
    end # is_default

  end # validations

  # named scopes
  describe "named scopes" do
    before(:each) do
      subject.save
      10.times { Factory.create(:image) }
    end

    describe "default" do
      it "default may be empty" do
        Image.default.should be_empty
      end

      it "default must only return images with is_default set to true" do
        subject.update_attributes(:is_default => true)
        Image.default.each { |i| i.is_default.should be_true }
      end

    end # default
  end # named scopes

end
