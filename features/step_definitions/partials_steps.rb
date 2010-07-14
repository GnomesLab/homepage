Then /^I should see the generic header$/ do
  header_link_test
end

def header_test
  page.should have_content('RSS')
  # assert page.has_content?("RSS")
  page.should have_content('Facebook')
  page.should have_content('Twitter')
  assert page.has_content?("HOME")
  page.should have_content('ABOUT')
  page.should have_content('SERVICES')
  page.should have_content('PROJECTS')
  page.should have_content('BLOG')
  page.should have_content('CONTACT')
  
end

Then /^I should click the generic header$/ do
  header_test
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
  footer_test
end

def footer_test
  assert page.has_content?("ABOUT")
  assert page.has_content?("BLOGROLL")
  assert page.has_content?("TAG CLOUD")
  assert page.has_content?("LATEST TWEETS")
end