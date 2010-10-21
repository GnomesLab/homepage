require 'spec_helper'

describe Post do

  subject { Factory.build(:post) }

  describe "associations" do
    it "belongs to a user" do
      subject.user.should be_a_kind_of User
      subject.should be_valid
    end
  end

  describe "accessible attributes" do

    it "defines the attributes that are mass assignable" do
      Post._accessible_attributes.to_a == ["user_id", "title", "body", "tag_list"]
    end

  end # attr_accessible

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

    describe "tags" do
      it "defines tags as an attribute" do
        subject.tag_list = "rails, routes"
        subject.should be_valid
      end
    end # tags

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

      it "should be RedClothable" do
        subject.html_safe_body
        subject.should be_valid
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

    describe "published" do
      it "should only return the posts that have been published" do
        Post.first.publish

        Post.published.should == Array(Post.first)
      end
    end

    describe "popular posts" do
      it "should return the 5 most popular posts" do
        popular = Post.popular(5)
        popular.should be_a_kind_of ActiveRecord::Relation
        popular.length.should == 5
        popular.first.views.should >= popular.last.views
      end
    end # popular posts

  end # named scopes

  describe "imported behaviors" do

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

  end # imported behaviors

  describe "class methods" do

    describe "tag cloud" do

      before :each do
        Factory.create :post, :tag_list => "ruby, rails"
      end

      it "lists all the tags avaliable in Posts" do
        cloud = Post.tag_cloud

        cloud.length.should == 2
        cloud.first.should be_a_kind_of ActsAsTaggableOn::Tag
        cloud.first.name.should == "ruby"
        cloud.last.name.should == "rails"
      end

      it "supports the limit to be overridden" do
        cloud = Post.tag_cloud 1

        cloud.length.should == 1
        cloud.first.should be_a_kind_of ActsAsTaggableOn::Tag
        cloud.first.name.should == "ruby"
      end

    end # tag_cloud

    describe "related posts" do
      before :each do
        2.times { |i| Factory.create(:post, :user => test_user) }
        3.times { |i| Factory.create(:published_post, :user => test_user) }
      end

      it "should return the 2 most popular published related posts" do
        post = Post.last
        related_posts = post.related(5)
        related_posts.should be_a_kind_of ActiveRecord::Relation
        related_posts.length.should == 2
        related_posts.first.views.should >= related_posts.last.views
        related_posts.each do |t|
          t.tag_list.should have_at_least(1).post.tag_list
        end
      end
    end # related posts

    describe "recent posts" do
      before :each do
        2.times { |i| Factory.create(:post, :user => test_user) }
        3.times { |i| Factory.create(:published_post, :user => test_user) }
      end

      it "should return the 3 most recent published posts" do
        recent_posts = Post.recent
        recent_posts.should be_a_kind_of ActiveRecord::Relation
        recent_posts.length.should == 3
        recent_posts.first.id >= recent_posts.last.id
      end
    end # recent posts

    describe "popular posts" do
      before :each do
        2.times { |i| Factory.create(:post, :user => test_user) }
        3.times { |i| Factory.create(:published_post, :user => test_user) }
      end

      it "should return the 3 most popular published posts" do
        popular = Post.most_popular(5)
        popular.should be_a_kind_of ActiveRecord::Relation
        popular.length.should == 3
        popular.first.views.should >= popular.last.views
      end
    end # popular posts

  end # class methods
  
  describe "instance methods" do
    describe "comments" do
      before :each do
        subject.save
        5.times { |i| Factory.create(:comment, :post => subject) }
        5.times { |i| Factory.create(:comment, :post => subject, :parent => Comment.first) }
        @invisible_comment_level1 = Factory.create(:comment, :post => subject, :visible => false)
        @invisible_comment_level2 = Factory.create(:comment, :post => subject, :parent => Comment.first, :visible => false)
      end

      describe "first level" do
        it "only returns visible comments" do
          subject.first_level_comments.should_not include @invisible_comment_level1
        end

        it "returns all comments" do
          subject.first_level_comments(true).should include @invisible_comment_level1
        end
      end # First level

      describe "second level" do
        it "only returns visible comments" do
          subject.second_level_comments(Comment.first).should_not include @invisible_comment_level2
        end

        it "returns all comments" do
          subject.second_level_comments(Comment.first, true).should include @invisible_comment_level2
        end
      end # Second level

      describe "count" do
        it "all comments" do
          subject.comments_count(true).should == subject.comments.count
        end

        it "visible comments" do
          subject.comments_count.should == subject.comments.visible.count
        end
      end
    end # comments

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

    describe "post publishing" do

      it "allows you to easely publish" do
        subject.publish.should be_true
      end

      it "has a published at date time" do
        subject.published_at.should be_nil
        subject.publish
        subject.published_at.should be_a_kind_of Time
      end

      it "returns false when asked if a new record has already been published" do
        subject.should_not be_published
      end

      it "only states that a post is published when it such setting has been explicitly defined" do
        subject.save
        subject.should_not be_published
        subject.publish
        subject.should be_published
      end

      it "saves a new record when asked to publish it" do
        subject.should be_new_record
        subject.publish
        subject.should_not be_new_record
        subject.should be_published
      end

      it "returns true but doesn't update the published at date if the record has already been published" do
        subject.publish
        expected = subject.published_at
        subject.publish.should be_true
        subject.published_at.should == expected
      end

    end # publish
  end # instance methods

end
