# encoding: UTF-8

Then /^I should see a generic contact error message$/ do
  page.should have_content("Oops! Your message could not be sent. Please check your input and try again.")
end

Then /^I should see a contact message successfully sent flash$/ do
  page.should have_content("Thank you for contacting us! We will get back to you shortly.")
end

Given /^I have contact without company name or phone number$/ do
  @contact = Factory.build(:enquiry, :company => '', :phone_number => '')
end

Given /^I have valid contact data$/ do
  @contact = Factory.build :enquiry
end

Given /^I fill in the contact form$/ do
  fill_in 'enquiry[name]',          :with => @contact.name
  fill_in "enquiry[email]",         :with => @contact.email
  fill_in "enquiry[company]",       :with => @contact.company
  fill_in "enquiry[phone_number]",  :with => @contact.phone_number
  fill_in "enquiry[message]",       :with => @contact.message
end

Given /^An email should be sent to Gnomeslab$/ do
  ActionMailer::Base.deliveries.should_not be_empty
end