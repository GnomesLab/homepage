require 'spec_helper'

context PostsHelper do

  describe "draw archive tree" do

    describe "when there are no posts" do

      it "returns an empty string when the archive tree is empty" do
        helper.draw_archive_tree.should == ""
      end

    end # with no posts

    describe "with posts" do

      it "should return the archive tree for all records" do
        1.upto(10) { |i| Factory.create :post, :created_at => Date.new(Time.now.year, i, 1) }

        helper.draw_archive_tree.should == %Q{<ul><li class=\"active\"><a href=\"#\" class=\"toggle\">[ + ]</a> <a href=\"/blog/2010\">2010</a><ul><li><a href=\"/blog/2010/01\">January (1)</a></li><li><a href=\"/blog/2010/02\">February (1)</a></li><li><a href=\"/blog/2010/03\">March (2)</a></li><li><a href=\"/blog/2010/04\">April (1)</a></li><li><a href=\"/blog/2010/05\">May (1)</a></li><li><a href=\"/blog/2010/06\">June (1)</a></li><li><a href=\"/blog/2010/07\">July (1)</a></li><li><a href=\"/blog/2010/08\">August (1)</a></li><li><a href=\"/blog/2010/09\">September (1)</a></li></ul></li></ul>}
      end

    end # with posts

    describe "overridable model" do

      it "allows the model name to be overriden" do
        lambda { helper.draw_archive_tree(:hello) }.should raise_error NameError
      end

    end # overridable model

    describe "overridable route" do

      it "defaults to the hardcoded route whenever the provided route is unknown" do
        1.upto(10) { |i| Factory.create :post, :created_at => Date.new(Time.now.year, i, 1) }

        helper.draw_archive_tree(:post, :xpto_path).should match /ul/
      end

    end # overridable route

  end # draw_archive_tree

end # PostsHelper
