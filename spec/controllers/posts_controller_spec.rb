# encoding: UTF-8

require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers

  describe "authorized?" do

    before :each do
      Factory.create(:post)
      Factory.create(:published_post)
    end

    describe "unpublished post" do
      before :each do
        controller.instance_eval("@post = Post.first")
      end

      it "returns true if user is signed in" do
        sign_in_user
        controller.send(:authorized?).should be_true
      end

      it "returns false if user is not signed in" do
        controller.send(:authorized?).should be_false
      end
    end # published post

    describe "published post" do
      before :each do
        controller.instance_eval("@post = Post.last")
      end

      it "returns true if user is signed in" do
        sign_in_user
        controller.send(:authorized?).should be_true
      end

      it "returns true if user is not signed in" do
        controller.send(:authorized?).should be_true
      end

    end # unpublished post

  end # can_view_post

  def sign_in_user
    sign_in Factory.create(:user)
  end

end # PostsController
