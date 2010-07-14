Given /^I have an invalid name$/ do
  @comment = Factory.build(:comment, :name => "")
end

Given /^I have an invalid email$/ do
  @comment = Factory.build(:comment, :email => "")
end

Given /^I have an invalid body$/ do
  @comment = Factory.build(:comment, :body => "")
end

Given /^I fill the comment form$/ do
  fill_in("Name", :with => @comment.name)
  fill_in("Email", :with => @comment.email)
  fill_in("Website", :with => @comment.website)
  fill_in("Body", :with => @comment.body)
end

Given # some blog text here do
  @post = Factory.build(:post, :name => "")
end

Given # some blog text here do
  @post = Factory.build(:post, :email => "")
end

Given # some blog text here do
  @post = Factory.build(:post, :body => "")
end

Given # some blog text here do
  fill_in("Name", :with => @post.name)
  fill_in("Email", :with => @post.email)
  fill_in("Website", :with => @post.website)
  fill_in("Body", :with => @post.body)
  fill_in("Tags", :with => @post.tags)
end