# encoding: UTF-8

require 'spec_helper'

describe StaticPagesHelper do

  describe "rotator_statements" do
    it "must contains 'We bring your ideas to life'" do
      helper.rotator_statements.should include 'We bring your ideas to life'
    end

    it "must contains 'Using effective processes'" do
      helper.rotator_statements.should include 'Using effective processes'
    end

    it "must contains 'Centered on our clients'" do
      helper.rotator_statements.should include 'Centered on our clients'
    end

    it "must contains 'Adding value to your business'" do
      helper.rotator_statements.should include 'Adding value to your business'
    end
  end # rotator_statements

end
