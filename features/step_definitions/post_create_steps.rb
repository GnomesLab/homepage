# FIXME: automate, instead of simulate
Given /^I am logged in$/ do
  user = Factory.create(:user)
  visit('/users/sign_in')
  fill_in("user_email", :with => user.email)
  fill_in("user_password", :with => user.password)
  click_button("Sign in")
end

Given /^I have an invalid title$/ do
  @post = Factory.build(:post, :title => "")
end

Given /^I have an invalid content$/ do
  @post = Factory.build(:post, :body => "")
end

Given /^I fill the post form$/ do
  fill_in("Title", :with => @post.title)
  fill_in("Text", :with => @post.body)
end