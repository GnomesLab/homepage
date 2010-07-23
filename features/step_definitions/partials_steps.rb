Then /^I should see the generic header$/ do
  page.should have_content('RSS')
  page.should have_content('Facebook')
  page.should have_content('Twitter')
  page.should have_content("Home")
  page.should have_content('About')
  page.should have_content('Services')
  page.should have_content('Projects')
  page.should have_content('Blog')
  page.should have_content('Contact')
end

Then /^I should click the generic header$/ do
  header_link_test
end

def header_link_test
  click_link "logo"
  visit path_to(request.headers['http_referer'])
  click_link "HOME"
  visit path_to(request.headers['http_referer'])
  click_link "ABOUT"
  visit path_to(request.headers['http_referer'])
  click_link "SERVICES"
  visit path_to(request.headers['http_referer'])
  click_link "PROJECTS"
  visit path_to(request.headers['http_referer'])
  click_link "BLOG"
  visit path_to(request.headers['http_referer'])
  click_link "CONTACT"
end

Then /^I should see the generic footer$/ do
  page.should have_content("About")
  page.should have_content("Blogroll")
  page.should have_content("Tag Cloud")
  page.should have_content("Latest Tweets")
end