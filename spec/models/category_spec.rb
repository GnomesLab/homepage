require 'spec_helper'

context Category do

  subject { Factory.build(:category) }

  describe "validations" do
    it "must have a name" do
      subject.name = nil
      subject.should_not be_valid
    end

    it "should be valid with all the properties set" do
      subject.should be_valid
    end
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