require 'spec_helper'

context ApplicationHelper do
  describe "content title" do
    it "should return the content title html for the provided text" do
      content_title('hello world').should == "<h2 class='border'>hello world</h2>"
    end
  end
end
