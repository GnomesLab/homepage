Given /^I have an invalid title$/ do
  @post = Factory.build(:post, :title => "")
end

Given /^I have an invalid content$/ do
  @post = Factory.build(:post, :body => "")
end

Given /^I fill the post form$/ do
  fill_in("Title", :with => @post.title)
  fill_in("Text",  :with => @post.body)
end