require 'spec_helper'

context ApplicationController do

  describe "friendly post path" do
    base_path = '/blog'

    it "defaults to nil" do
      controller.friendly_post_path.should be_nil
    end

    it "accepts a post record" do
      post = Factory.create(:published_post)

      controller.friendly_post_path(post).should match /^\/blog\/201\d\/(0[1-9]|1[012])\/\d.+$/
    end

    it "rejects all other parameter types" do
      [{ :year => 2010 }, "post", 2010, Factory.create(:user)].each do |v|
        controller.friendly_post_path(v).should be_nil
      end
    end

  end # friendly_post_path

end
