# encoding: UTF-8

Given /^I have an account$/ do
  Factory.create(:user) unless User.first
end