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

end
