require 'spec_helper'

describe ApplicationController do

  describe "friendly_post_path" do
    base_path = '/blog'

    it "defaults to nil" do
      controller.friendly_post_path.should be_nil
    end

    it "accepts a published post record" do
      post = Factory.create(:published_post)
      controller.friendly_post_path(post).should match /^\/blog\/201\d\/(0[1-9]|1[012])\/\S+/
    end

    it "accepts a unpublished post record" do
      post = Factory.create(:post)
      controller.friendly_post_path(post).should match /^\/posts\/(\S+)/
    end

    it "rejects all other parameter types" do
      [{ :year => 2010 }, "post", 2010, Factory.create(:user)].each do |v|
        controller.friendly_post_path(v).should be_nil
      end
    end

  end # friendly_post_path

  describe "tweet_path" do

    it "returns the url for a gnomeslab tweet" do
      controller.tweet_path(12345).should == 'http://twitter.com/gnomeslab/status/12345'
    end

  end # tweet_path

  describe "ensure_domain" do

    it "ignores the redirect order unless the env is set to production and the host is not gnomeslab.com" do
      Rails.env.should_not == 'production'
      request.env['HTTP_HOST'].should_not == 'gnomeslab.com'
      response.should be_success
    end

  end # ensure_domain

end
