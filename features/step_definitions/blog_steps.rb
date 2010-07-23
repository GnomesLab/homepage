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