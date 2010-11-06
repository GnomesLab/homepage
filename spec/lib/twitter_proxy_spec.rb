# encoding: UTF-8

require 'spec_helper'

describe TwitterProxy do

  describe "behavior" do

    describe "singleton " do
      it "must have a instance method" do
        TwitterProxy.should respond_to :instance
      end

      it "can't be explicited initiated" do
        lambda { TwitterProxy.new }.should raise_error(NoMethodError)
      end
    end # singleton

  end # behavior

  describe "get_tweets" do

    describe "defaults" do
      it "uses gnomeslab user" do
        TwitterProxy.instance.get_tweets.first.user.screen_name.should == 'gnomeslab'
      end

      it "returns 3 tweets" do
        TwitterProxy.instance.get_tweets.size.should == 3
      end
    end # defaults

    describe "overrides" do
      it "allows to override the user" do
        TwitterProxy.instance.get_tweets('miguelfteixeira').first.user.screen_name.should == 'miguelfteixeira'
      end

      it "allows to override the count" do
        TwitterProxy.instance.get_tweets('gnomeslab', 2).size.should == 2
      end
    end # overrides

    describe "behavior" do
      it "never breaks the app" do
        TwitterProxy.instance.get_tweets('dummy-user-dummy-user-dummy').should be_nil
      end
    end # behavior

  end # get_tweets

end # TwitterProxy
