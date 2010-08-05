require 'spec_helper'

context Post do

  subject { Factory.build(:post) }

  describe "associations" do
    it "belongs to a user" do
      subject.user.should be_a_kind_of User
      subject.should be_valid
    end
  end

  describe "validations" do

    it "recognises valid input data" do
      subject.should be_valid
    end

    describe "name" do
      it "defines user as a required attribute" do
        subject.user = nil
        subject.should_not be_valid
        subject.errors.should include :user
      end
    end # name

    describe "title" do
      it "is a required attribute" do
        subject.title = nil
        subject.should_not be_valid
        subject.errors.should include :title
      end

      it "has a minimum lenght" do
        subject.title = "hi"
        subject.should_not be_valid
        subject.errors.should include :title
      end

      it "has a maximum lenght" do
        subject.title = "iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii 35 is max"
        subject.should_not be_valid
        subject.errors.should include :title
      end
    end # title

    describe "body" do
      it "is a required attribute" do
        subject.body = nil
        subject.should_not be_valid
        subject.errors.should include :body
      end

      it "has a minimum lenght" do
        subject.body = "ni"
        subject.should_not be_valid
        subject.errors.should include :body
      end
    end

  end # Validations

  describe "named scopes" do

    before :each do
      10.times { |i| Factory.create(:post, :user => test_user) }
    end

    describe "latest posts" do
      it "should return the latest posts" do
        Post.order('id desc').first.id == Post.latest.first.id
      end
    end # latest posts

    describe "popular posts" do
      it "should return the 5 most popular posts" do
        popular = Post.popular
        popular.should be_a_kind_of ActiveRecord::Relation
        popular.size.should == 5
        popular.first.views.should >= popular.last.views
      end
    end # popular posts

  end # named scopes

  describe "archive tree" do

    it "should extend klass with its ArchiveTree::ClassMethods" do
      [:archived_years, :archived_months, :archive_tree].each do |method|
        Post.should respond_to method
      end
    end # class methods

  end # archive tree

  describe "acts as taggable on" do

    it "supports tag definitions" do
      p = Factory.create :post, :tag_list => 'gnomeslab'

      p.tag_list.should include "gnomeslab"
      p.tags.should be_a_kind_of Array
      p.tags.first.name.should == "gnomeslab"
    end

  end # acts_as_taggable_on

  describe "html_safe_body" do

    it "adds an HTML paragraph by default" do
      p = Factory.build :post, :body => "hello world"
      p.html_safe_body.should == "<p>hello world</p>"
    end

    it "should escape html considered to be unsafe" do
      p = Factory.build :post, :body => "<a href='http://google.com'>google</a>"
      p.html_safe_body.should == "<p>&lt;a href='http://google.com'&gt;google&lt;/a&gt;</p>"
    end

  end # html_safe_body

end
