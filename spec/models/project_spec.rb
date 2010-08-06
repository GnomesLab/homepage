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

    describe "images" do
      it "may not have a image" do
        subject.images = []
        subject.should be_valid
      end

      it "may have one image" do
        subject.images << Factory.create(:image)
        subject.should be_valid
      end

      it "may have more than one image" do
        subject.images << Factory.create(:image)
        subject.images << Factory.create(:image)
        subject.should be_valid
      end

    end

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

  # instance methods
  describe "instance methods" do
    before :each do
      subject.save
    end

    describe "default image" do
      it "returns nil if there is no image" do
        subject.default_image.should be_nil
      end

      it "in the absence of default image may return the first one" do
        3.times { Factory.create(:image, :project => subject) }
        subject.default_image.should == subject.images.first
      end

      it "returns the image with is_default set to true" do
        3.times { Factory.create(:image, :project => subject, :is_default => true) }
        subject.default_image.is_default.should be_true
      end
    end # default image

    describe "previews" do
      it "returns an empty array if there is no image" do
        subject.previews.should be_empty
      end

      it "returns an empty array if there is only one image" do
        Factory.create(:image, :project => subject)
        subject.previews.should be_empty
      end

      it "shouldn't return the default image" do
        3.times { Factory.create(:image, :project => subject, :is_default => true) }
        subject.previews.should == subject.previews - [subject.default_image]
      end
    end # previews
  end # instance methods

end
