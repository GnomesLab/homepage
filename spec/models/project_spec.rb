require 'spec_helper'

context Project do
  subject { Factory.build(:project) }

  describe "validations" do
  end # validations

  describe "named scopes" do
    before(:each) do
      10.times.each { Factory.create(:project) }
    end

    it "reverse named scope must order the projects by date desc" do
      Project.reverse.should == Project.order('date desc')
    end
  end

  describe "pagination" do
    it "should only display 5 projects per page" do
      Project.per_page.should == 5
    end
  end

end
