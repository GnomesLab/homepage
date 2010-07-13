Given /^I have bad email build$/ do
  @contact = Factory.build(:contact, :email => "")
end

Given /^I fill the contact form$/ do
  fill_in("First Name", :with => @contact.firstname)
  fill_in("Last Name", :with => @contact.lastname)
  fill_in("Email", :with => @contact.email)
  fill_in("Company", :with => @contact.company)
  fill_in("Message", :with => @contact.message)
end