require 'spec_helper'

context Category do

  subject { Factory.build(:category) }

  describe "associations" do

    it "has many projects" do
      project_attributes = Factory.attributes_for(:project)

      subject.projects.should be_a_kind_of Array
      subject.projects.build(project_attributes).should be_a_kind_of(Project)
      subject.projects.first.should == Project.new(project_attributes)
    end

  end # associations

  describe "validations" do

    it "should be valid with all the properties set" do
      subject.should be_valid
    end

    describe "name" do
      it "is a required attribute" do
        subject.name = nil
        subject.should_not be_valid
        subject.errors.should include :name
      end
    end # name

  end # Validations

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
        subject.should == Category.find(subject.friendly_id)
      end

      it "should be updated" do
        old_friendly_id = subject.friendly_id
        subject.update_attributes(:name => 'new category name').should be_true
        subject.friendly_id.should_not == old_friendly_id
      end

      it "should be versionated" do
        old_friendly_id = subject.friendly_id
        subject.update_attributes(:name => 'new category name').should be_true
        Category.find(old_friendly_id).should == Category.find(subject.friendly_id)
      end
    end # friendly_id
  end # attributes

  # named scopes
  describe "named scopes" do
    before(:each) do
      10.times.each { Factory.create(:category) }
    end

    it "ordered_by_name named scope must order the categories by name asc" do
      Category.ordered_by_name.should == Category.order('name asc')
    end
  end # named scopes

  # class methods
  describe "class methods" do
    before :each do
      subject.save
    end

    describe "find_by_friendly_id" do
      it "should have a find_by_friendly_id method" do
        Category.should respond_to :find_by_friendly_id
      end

      it "should return nil if the friendly_id doesn't exists" do
        Category.find_by_friendly_id('unexisting category').should be_nil
      end

      it "should return a category if the friendly_id exists" do
        Category.find_by_friendly_id(subject.friendly_id).should_not be_nil
      end
    end
  end # class methods

end
