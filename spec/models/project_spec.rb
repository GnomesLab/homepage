require 'spec_helper'

context Project do

  subject { Factory.build(:project) }

  describe "validations" do
    it "must have a title" do
      subject.title = nil
      subject.should_not be_valid
    end

    it "must have a subtitle" do
      subject.subtitle = nil
      subject.should_not be_valid
    end

    it "must have a image" do
      subject.image = nil
      subject.should_not be_valid
    end

    it "must have a date" do
      subject.date = nil
      subject.should_not be_valid
    end

    it "must have a category" do
      subject.category = nil
      subject.should_not be_valid
    end

    it "must have a valid category" do
      subject.category = Category.new
      subject.should_not be_valid
    end

    it "must be valid with all the properties set" do
      subject.should be_valid
    end
  end # validations

  describe "named scopes" do
    before(:each) do
      10.times.each { Factory.create(:project) }
    end

    it "reverse named scope must order the projects by date desc" do
      Project.reverse.should == Project.order('date desc')
    end
  end # named scopes

  describe "pagination" do
    it "should only display 5 projects per page" do
      Project.per_page.should == 5
    end
  end # pagination

  describe "equality" do
    
  end

end
