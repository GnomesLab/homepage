Given /^there are ([\d+]) comment(?:s?)$/ do |n|
  n.to_i.times { Factory.create(:comment, :post => Post.first) }
end

Given /^the comment has no (\S+)$/ do |field|
  Post.first.update_attributes(field => nil)
end

Then /^I should see ([\d+]) comment(?:s?)$/ do |n|
  ["//div[@id='comments']/h4[contains(@class, 'comments-count')]",
  "//div[@class='post-meta']/span[@class='right']/a[contains(@class, 'comments-count')]"].each do |xpath|
    comments_number = find(:xpath, xpath)
    comments_number.text.should include n
  end
end

Then /^the comments list should contain ([\d+]) comment(?:s?)$/ do |n|
  page.should have_css('.comment-list > ol > li', :count => n.to_i)
end

Then /^I should see the comment name$/ do
  first_level_comments.each do |c|
    comments_list.should include c.name
  end
end

Then /^I should see the comment date$/ do
  first_level_comments.each do |c|
    comments_list.should include I18n.l(c.created_at, :format => :long)
  end
end

Then /^I should see the comment body$/ do
  first_level_comments.each do |c|
    comments_list.should include c.body
  end
end

Then /^I should see the comment number$/ do
  pending
  node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol/li/div[contains(@class, 'comment-meta')]/strong")
  debugger
  first_level_comments.each_index do |idx|
    node.text.should include "#{idx+1}."
  end
end

Then /^I should(n\'t)? see the comment name as a link to the url$/ do |n|
  first_level_comments.each do |c|
    if n.blank?
      comments_list.should include c.url
    else
      pending
      node = find(:css, '.comment-list > ol > li > comment-meta > span.comment-creator')
      debugger
      node.should include c.name
    end
  end
end

def comments_list
  node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol")
  node.text
end

def first_level_comments
  Post.first.comments.first_level
end
