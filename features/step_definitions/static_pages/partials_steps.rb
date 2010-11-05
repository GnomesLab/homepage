# encoding: UTF-8

Then(/^I should see the generic header$/) do
  page.should have_content('Contact us')
  page.should have_content('@gnomeslab.com')
  page.should have_content('RSS')
  page.should have_content('Twitter')
  page.should have_content("Home")
  page.should have_content('About')
  page.should have_content('Services')
  page.should have_content('Blog')
  page.should have_content('Contact')
end

Then(/^I should click the generic header$/) do
  find("#logo a").click # logo
  page.should have_content('Who are we?')
  visit root_path

  { 1 => 'Who are we?', # home
    2 => 'About us',
    3 => 'Services',
    4 => 'Popular Posts',
    5 => 'Contact Gnomeslab' }.each { |k,v| top_menu_clicker(k,v) }
end

Then(/^I should see "([^"]*)" selected in the header$/) do |field|
  find("#head #navigation a[class~='active']").should have_content(field)
end

Then(/^I should see the generic footer$/) do
  page.should have_content("About")
  page.should have_content("Latest Posts")
  page.should have_content("Tag Cloud")
  page.should have_content("Latest Tweets")
end

Then(/^I should see the (\d+) recent posts titles$/) do |n|
  Post.recent(n.to_i).each_with_index do |p, i|
    page.should have_css("#footer .col3:nth-child(3) li:nth-child(#{i+1})")
    find("#footer .col3:nth-child(3) li:nth-child(#{i+1}) a[href='#{post_path(p)}']").should have_content(p.title)
  end
end

Then(/^I should see the (\d+) latest Gnomeslab tweets$/) do |n|
  if tweets = TwitterProxy::get_tweets
    tweets.each_with_index do |tweet, i|
      page.should have_css("#footer .col-right li:nth-child(#{i+1})")
      find("#footer .col-right li:nth-child(#{i+1}) p").should have_content(tweet.text)
      find("#footer .col-right li:nth-child(#{i+1}) a[href='http://twitter.com/gnomeslab/status/#{(tweet.id)}']").should
        have_content(I18n.l(Time.parse(tweet.created_at), :format => :long))
    end
  end
end

#
# Helpers
#
def top_menu_clicker(index = 0, content = nil)
  find(:xpath, "//div[@id='navigation']/ul/li[#{index}]/a").click # home
  page.should have_content(content)
  visit root_path
end