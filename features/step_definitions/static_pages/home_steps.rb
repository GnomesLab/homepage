# encoding: UTF-8
Then(/^I should see the contact us link$/) do
  find(:css, '#header .socials').should have_link('diogo.almeida@gnomeslab.com')
  page.should have_css("#header .socials .contact-link[href='mailto:diogo.almeida@gnomeslab.com']")
end

Then(/^I should see the twitter link$/) do
  find(:css, '#header .socials').should have_link('Twitter')
  page.should have_css("#header .socials .twitter-link[href='http://twitter.com/gnomeslab']")
end

Then(/^I should see rss link$/) do
  find(:css, '#header .socials').should have_link('RSS')
  page.should have_css("#header .socials .rss-link[href='http://feeds.feedburner.com/gnomeslab_blog']")
end

Then(/^I should see the rotator$/) do
  page.should have_css('#slider #slider-holder ul li')
end

Then(/^I should see "([^"]*)" in the position (\d+) of the rotator$/) do |statement, position|
  find(:css, "#slider #slider-holder ul li:nth-child(#{position})").should have_content(statement)
end

Then(/^I should be able to link to about page through the images$/) do
  page.should have_css("#slider #slider-holder ul li a[href='#{about_us_path}'] img", :count => 4)
end

Then(/^I should be able to jump to a specific image$/) do
  1.upto(4).each do |i|
    find(".slider-controls a:nth-child(#{i})").text.should == i.to_s
  end
end
