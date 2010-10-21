Then /^I should see the generic header$/ do
  page.should have_content('Contact us')
  page.should have_content('@gnomeslab.com')
  page.should have_content('RSS')
  # page.should have_content('Facebook')
  page.should have_content('Twitter')
  page.should have_content("Home")
  page.should have_content('About')
  page.should have_content('Services')
  # page.should have_content('Projects')
  page.should have_content('Blog')
  page.should have_content('Contact')
end

Then /^I should click the generic header$/ do
  find("#logo a").click # logo
  page.should have_content('Who are we?')
  visit root_path

  { 1 => 'Who are we?', # home
    2 => 'About us',
    3 => 'Services',
    # 4 => 'Projects',
    4 => 'Popular Posts',
    5 => 'Feedback' }.each { |k,v| top_menu_clicker(k,v) }
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
