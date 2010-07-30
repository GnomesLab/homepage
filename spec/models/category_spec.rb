require 'spec_helper'

context Category do

  subject { Factory.build(:category) }

  describe "associations" do
    it "should have projects" do
      project_attributes = Factory.attributes_for(:project)

      subject.projects.should be_a_kind_of Array
      subject.projects.build(project_attributes).should be_a_kind_of(Project)
      subject.projects.first.should == Project.new(project_attributes)
    end
  end # associations

  describe "validations" do
    it "must have a name" do
      subject.name = nil
      subject.should_not be_valid
    end

    it "should be valid with all the properties set" do
      subject.should be_valid
    end
  end # Validations

end
