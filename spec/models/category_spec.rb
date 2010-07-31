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

  describe "named scopes" do
    before(:each) do
      10.times.each { Factory.create(:category) }
    end

    it "ordered_by_name named scope must order the categories by name asc" do
      Category.ordered_by_name.should == Category.order('name asc')
    end
  end # named scopes

end