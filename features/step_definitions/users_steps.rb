Given /^I have an account$/ do
  user = Factory.create(:user)
end

Given /^I am not authenticated$/ do
  visit('/users/sign_out')
  visit('/users/sign_in')
end