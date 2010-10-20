Given /^there are ([\d+]) comment(?:s?)$/ do |n|
  n.to_i.times { Factory.create(:comment, :post => Post.first) }
  Comment.last.destroy while Comment.count > n.to_i
end

Given /^the comment has no (\S+)$/ do |field|
  Post.first.update_attributes(field => nil)
end

Given /^There is a hidden comment$/ do
  Comment.first.update_attributes(:visible => 0)
end

Then /^I should not see the hidden comment$/ do
  comments_list.should_not include Comment.first.body
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
  first_level_comments.each_index do |i|
    node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol/li[#{i + 1}]/div[contains(@class, 'comment-meta')]/strong")
    node.text.should include "#{i+1}."
  end
end

Then /^I should(n\'t)? see the comment name as a link to the url$/ do |n|
  first_level_comments.each_with_index do |c, i|
    if n.blank?
      xpath = "//div[contains(@class, 'comment-list')]/ol/li[#{i+1}]/div[contains(@class, 'comment-meta')]/a[@href='#{c.url}']"
      page.should have_xpath(xpath, :count => 1)
    else
      find(:css, ".comment-list > ol > li:nth-child(#{i+1}) > .comment-meta > .comment-creator").text.should include c.name
    end
  end
end

# Helpers
def comments_list
  find(:xpath, "//div[contains(@class, 'comment-list')]/ol").text
end

def first_level_comments
  Post.first.comments.first_level
end
