Given /^I have an invalid email$/ do
  @comment = Factory.build(:comment, :email => "")
end

Given /^I fill the comment form$/ do
  fill_in("Name", :with => @comment.name)
  fill_in("Email", :with => @comment.email)
  fill_in("Website", :with => @comment.website)
  fill_in("Body", :with => @comment.body)
end
  
