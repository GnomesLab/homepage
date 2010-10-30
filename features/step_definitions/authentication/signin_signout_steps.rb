Given /^I have an account$/ do
  Factory.create(:user) unless User.first
end