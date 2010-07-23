require 'spec_helper'

context ApplicationHelper do
  describe "page title" do
    it "returns gnomeslab by default" do
      title.should == 'Gnomeslab'
    end

    it "allows its value to be overridden" do
      title('howdy').should == 'howdy'
    end

    it "can also append ' - Gnomeslab' to the title" do
      title('Blog', true).should == 'Blog | Gnomeslab'
    end
  end

  describe "content title" do
    it "should return the content title html for the provided text" do
      content_title('hello world').should == "<h2 class='border'>hello world</h2>"
    end
  end
end
