Given /^I have a post$/ do
  visit posts_path
  click_link "New Post"
  fill_in "Name", :with => "John"
  fill_in "Title", :with => "The Spoon"
  fill_in "Content", :with => "There is no spoon"
  check "Visible"
  click_button "Create Post"
end

Given /^I have (\d+) posts$/ do |n|
  n.to_i.times do
    visit posts_path
    click_link "New Post"
    fill_in "Name", :with => "John"
    fill_in "Title", :with => "The Spoon"
    fill_in "Content", :with => "There is no spoon"
    check "Visible"
    click_button "Create Post"
  end
end
  
