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
  find("#logo a").click # logo
  page.should have_content('Who are we?')
  visit root_path
  top_menu_clicker 1, 'Who are we?' # home
  top_menu_clicker 2, 'About us'
  top_menu_clicker 3, 'Services'
  top_menu_clicker 4, 'Projects'
  top_menu_clicker 5, 'Integer dictum nulla tempus'
  top_menu_clicker 6, 'Feedback'
end

def top_menu_clicker(index = 0, content = nil)
  find(:xpath, "//div[@id='navigation']/ul/li[#{index}]/a").click # home
  page.should have_content(content)
  visit root_path
end

Then /^I should see the generic footer$/ do
  page.should have_content("About")
  page.should have_content("Blogroll")
  page.should have_content("Tag Cloud")
  page.should have_content("Latest Tweets")
end