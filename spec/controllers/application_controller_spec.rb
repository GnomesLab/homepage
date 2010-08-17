require 'spec_helper'

context ApplicationController do

  base_path = '/blog'

  describe "friendly post path" do

    it "defaults to nil" do
      controller.friendly_post_path.should be_nil
    end

    it "accepts a post record" do
      post = Factory.create(:post, :created_at => Date.new(2010, 1, 1))

      controller.friendly_post_path(post).should == "/blog/2010/01/#{post.id.to_s}-w"
    end

    it "rejects all other parameter types" do
      [{ :year => 2010 }, "post", 2010, Factory.create(:user)].each do |v|
        controller.friendly_post_path(v).should be_nil
      end
    end

  end # friendly_post_path

end
