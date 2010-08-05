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

  # attributes
  describe "attributes" do

    before :each do
      subject.save
    end

    describe "friendly_id" do
      it "is automatically set after a save call" do
        subject.friendly_id.should_not be_nil
      end

      it "should be used in find" do
        subject.should == Project.find(subject.friendly_id)
      end

      it "should be updated" do
        old_friendly_id = subject.friendly_id
        subject.update_attributes(:title => 'new project title').should be_true
        subject.friendly_id.should_not == old_friendly_id
      end

      it "should be versionated" do
        old_friendly_id = subject.friendly_id
        subject.update_attributes(:title => 'new project title').should be_true
        Project.find(old_friendly_id).should == Project.find(subject.friendly_id)
      end
    end # friendly_id

  end # attributes

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

  # class methods
  describe "class methods" do
    before :each do
      subject.save
    end

    describe "find_by_friendly_id" do
      it "should have a find_by_friendly_id method" do
        Project.should respond_to :find_by_friendly_id
      end

      it "should return nil if the friendly_id doesn't exists" do
        Project.find_by_friendly_id('dummy-project').should be_nil
      end

      it "should return a project if the friendly_id exists" do
        Project.find_by_friendly_id(subject.friendly_id).should_not be_nil
      end
    end
  end # class methods

end
