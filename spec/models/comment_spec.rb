require 'spec_helper'

describe Comment do

  subject { Factory.build(:comment) }

  describe "default" do
    describe "visible" do
      it "is true" do
        subject.visible.should be_true
      end
    end
  end

  describe "validations" do
    it "must be valid with all the properties set" do
      subject.should be_valid
    end

    describe "name" do
      it "is a required attribute" do
        subject.name = nil
        subject.should_not be_valid
        subject.errors.should include :name
      end

      it "is greater than 2 characters long" do
        subject.name = 'z'
        subject.should_not be_valid
        subject.errors.should include :name
      end

      it "is shorter than 16 characters long" do
        subject.name = (0..17).map { ('a'..'z').to_a[rand(26)] }.join
        subject.should_not be_valid
        subject.errors.should include :name
      end
    end # name

    describe "email" do
      it "is a required attribute" do
        subject.email = nil
        subject.should_not be_valid
        subject.errors.should include :email
      end

      it "must be in valid format" do
        subject.email = 'dummy-email'
        subject.should_not be_valid
        subject.errors.should include :email
      end
    end # email

    describe "url" do
      it "is not a required attribute" do
        subject.url = nil
        subject.should be_valid
      end

      it "if set must be valid" do
        subject.url = 'ftp://1.1.1.1'
        subject.should_not be_valid
        subject.errors.should include :url
      end
    end # url

    describe "body" do
      it "is a required attribute" do
        subject.body = nil
        subject.should_not be_valid
        subject.errors.should include :body
      end
      
      it "is greater than 2 characters long" do
        subject.body = 'z'
        subject.should_not be_valid
        subject.errors.should include :body
      end
      
      it "is smaller than 3000 characters long" do
        subject.body = (0..3001).map { ('a'..'z').to_a[rand(26)] }.join
        subject.should_not be_valid
        subject.errors.should include :body
      end
    end # body

    describe "parent" do
      it "is not a required attribute" do
        subject.parent = nil
        subject.should be_valid
      end

      it "must belongs to the same post as the parent" do
        subject.parent = Factory.build(:comment)
        subject.should_not be_valid
        subject.errors.should include :post
      end

      it "must be a first level parent" do
        subject.parent = Factory.create(:comment, :post => subject.post)
        subject.should be_valid
      end

      it "can't be a second level parent" do
        first_level = Factory.build(:comment, :post => subject.post)
        second_level = Factory.build(:comment, :parent => first_level, :post => subject.post)
        subject.parent = second_level
        subject.should_not be_valid
        subject.errors.should include :parent
      end
    end # parent

    describe "post" do
      it "is required" do
        subject.post = nil
        subject.should_not be_valid
        subject.errors.should include :post
      end
    end # post
  end # validations

  describe "named scopes" do
    before :each do
      post = Factory.create(:post)
      5.times { |i| Factory.create(:comment, :post => post) }
      5.times { |i| Factory.create(:comment, :post => post, :parent => Comment.first) }
    end

    describe "first level" do
      it "should only return comments without parent" do
        Comment.first_level.each { |c| c.parent.should be_nil }
      end
    end # first level

    describe "second level" do
      it "should only return comments with the specified parent" do
        Comment.second_level(Comment.first).each { |c| c.parent.should == Comment.first }
      end
    end # second level
    
    describe "visible" do
      it "returns only visible comments" do
        subject.visible = false
        subject.save
        Comment.visible.should_not include subject
      end
    end
  end # named scopes

  describe "dependencies" do
    describe "post" do
      it "must be destroyed with the post" do
        subject.save
        subject.post.destroy
        Comment.find_by_id(subject.id).should be_nil
      end
    end
  end # dependencies

end
