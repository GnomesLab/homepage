# encoding: UTF-8

require 'spec_helper'

describe FriendlyIdFinder do

  subject { Factory.create(:post) }

  describe "Inclusion" do

    it "must include the find method" do
      Post.should respond_to :find_by_friendly_id
    end

  end # Inclusion

  describe "find_by_friendly_id" do
    it "returns the post if the friendly_id exists" do
      Post.find_by_friendly_id(subject.title.downcase.gsub(' ', '-')).should_not be_nil
    end

    it "returns nil if the friendly_id doesn't exists" do
      Post.find_by_friendly_id('dummy-friendly-id').should be_nil
    end
  end # find_by_friendly_id

end
