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

        helper.draw_archive_tree.should == %Q{<ul><li class=\"active\"><a href=\"#\" class=\"toggle\">[ + ]</a> <a href=\"#\">2010</a><ul><li><a href=\"#\">January (1)</a></li><li><a href=\"#\">February (1)</a></li><li><a href=\"#\">March (2)</a></li><li><a href=\"#\">April (1)</a></li><li><a href=\"#\">May (1)</a></li><li><a href=\"#\">June (1)</a></li><li><a href=\"#\">July (1)</a></li><li><a href=\"#\">August (1)</a></li><li><a href=\"#\">September (1)</a></li></ul></li></ul>}
      end

    end # with posts

  end # draw_archive_tree

end # PostsHelper
