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
  comments_list.include? Comment.first.name
end

Then /^I should see the comment date$/ do
  comments_list.include? I18n.l(Comment.first.created_at, :format => :long)
end

Then /^I should see the comment body$/ do
  comments_list.include? Comment.first.body
end

Then /^I should see the comment number$/ do
  node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol/li/div[contains(@class, 'comment-meta')]/strong")
  node.text.should == '1.'
end

Then /^I should(n\'t)? see the comment name as a link to the url$/ do |n|
  if n.blank?
    comments_list.include? Comment.first.url
  else
    find(:css, '.comment-list > ol > li > comment-meta > span.comment-creator')
  end
end

def comments_list
  node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol/li")
  node.text
end