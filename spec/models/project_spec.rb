require 'spec_helper'

context Project do

  subject { Factory.build(:project) }

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

    describe "subtitle" do
      it "is a required attribute" do
        subject.subtitle = nil
        subject.should_not be_valid
        subject.errors.should include :subtitle
      end
    end # subtitle

    describe "image" do
      it "is a required attribute" do
        subject.image = nil
        subject.should_not be_valid
        subject.errors.should include :image
      end
    end # image

    describe "date" do
      it "is a required attribute" do
        subject.date = nil
        subject.should_not be_valid
        subject.errors.should include :date
      end
    end # date

    describe "category" do
      it "is a required attribute" do
        subject.category = nil
        subject.should_not be_valid
        subject.errors.should include :category
      end

      it "must have a valid category" do
        subject.category = Category.new
        subject.should_not be_valid
        subject.errors.should include :category
      end
    end # category

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

end
