# Given /^I have an invalid name$/ do
#   @comment = Factory.build(:comment, :name => "")
# end

Given /^I have an account$/ do
  @user = Factory.build(:user)
end

Given "I am not authenticated" do
  visit('/users/sign_out')
  visit('/users/sign_in')
end