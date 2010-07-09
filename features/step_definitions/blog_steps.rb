Given /^I have a post$/ do
  visit posts_path
  click_link "New Post"
  fill_in "Name", :with => "pedro"
  fill_in "Title", :with => "teste"
  fill_in "Content", :with => "contenido"
  click_button "Create Post"
end
