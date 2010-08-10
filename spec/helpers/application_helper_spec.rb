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
  end # page title

  describe "content title" do
    it "should return the content title html for the provided text" do
      content_title('hello world').should == "<h2 class='border'>hello world</h2>"
    end
  end # content title

  describe "top menu link" do
    before :each do
      helper.stub!(:params).and_return({ :controller => 'static_pages', :action => 'services' })
    end

    it "returns a non active link" do
      helper.top_menu_link(:home).should == %Q{<a href=\"/\">Home</a>}
    end
    
    it "returns an active link" do
      helper.top_menu_link(:services).should == %Q{<a href=\"/services\" class=\"active\">Services</a>}
    end
  end # top menu link

  describe "draw tag cloud" do

    it "defaults to the post model" do
      Factory.create :post
      cloud = []

      ['rails', 'ruby', 'regexp'].each { |t| cloud << "<a href=\"/posts/tagged/#{t}\" class=\"tag-size7\">#{t}</a>" }

      helper.draw_tag_cloud.should == cloud.join(' ')
    end

    it "limits the number of tags to 40" do
      tags = []
      41.times { |i| tags << "tag_#{i}" }

      Factory.create :post, :tag_list => tags.join(', ')

      helper.draw_tag_cloud.should == tags.reject! { |t| t == 'tag_40' }.map! do |t|
        "<a href=\"/posts/tagged/#{t}\" class=\"tag-size7\">#{t}</a>"
      end.join(' ')
    end

  end # draw tag cloud
end
