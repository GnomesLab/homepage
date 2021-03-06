# encoding: UTF-8

Given(/^there are ([\d+]) comment(?:s?)$/) do |n|
  n.to_i.times { Factory.create(:comment, :post => Post.first) }
  Post.first.comments.last.destroy while Post.first.comments.count > n.to_i
end

Given /^I have a question$/ do
  Factory.create(:question)
end

Given(/^the comment has no (\S+)$/) do |field|
  Comment.first.update_attributes(field => nil)
end

Given(/^There is a hidden comment$/) do
  Comment.first.update_attributes(:visible => 0)
end

Then(/^I should not see the hidden comment$/) do
  comments_list.should_not include Comment.first.body
end

Then(/^I should see ([\d+]) comment(?:s?)$/) do |n|
  ["//div[@id='comments']/h4[contains(@class, 'comments-count')]",
  "//div[@class='post-meta']/div[contains(@class, 'comments')]/a[contains(@class, 'comments-count')]"].each do |xpath|
    comments_number = find(:xpath, xpath)
    comments_number.text.should include n
  end
end

Then(/^the comments list should contain ([\d+]) comment(?:s?)$/) do |n|
  page.should have_css('.comment-list > ol > li', :count => n.to_i)
end

Then(/^I should see the comment name$/) do
  root_comments.each do |c|
    comments_list.should include c.name
  end
end

Then(/^I should see the comment date$/) do
  root_comments.each do |c|
    comments_list.should include I18n.l(c.created_at, :format => :long)
  end
end

Then(/^I should see the comment body$/) do
  root_comments.each do |c|
    comments_list.should include c.body
  end
end

Then(/^I should see the comment number$/) do
  root_comments.each_index do |i|
    node = find(:xpath, "//div[contains(@class, 'comment-list')]/ol/li[#{i + 1}]/div[contains(@class, 'comment-meta')]/strong")
    node.text.should include "#{i+1}."
  end
end

Then(/^I should(n\'t)? see the comment name as a link to the url$/) do |n|
  root_comments.each_with_index do |c, i|
    if n.blank?
      page.should have_css(".comment-list li:nth-child(#{i+1}) a.comment-creator[href='#{c.url}']", :count => 1)
    else
      find(:css, ".comment-list li:nth-child(#{i+1}) span.comment-creator").text.should include c.name
    end
  end
end

Then(/^I click on a comment url it should open a new window$/) do
  page.should have_css("a.comment-creator[target='_blank']", :count => root_comments.count)
end

Then(/^I should see the (\d+) most recent comments$/) do |n|
  Comment.recent(n.to_i).each_with_index do |c, i|
    find(:css, "#recent-comments > .entry li:nth-child(#{i+1})").text.should include c.body
  end
end

Then(/^I should see a link to read more for each of the (\d+) comments$/) do |n|
  Comment.recent(n.to_i).each_with_index do |c, i|
    find("#recent-comments > .entry li:nth-child(#{i+1})").should have_link("more")
    page.should have_css("#recent-comments > .entry li:nth-child(#{i+1}) a[href='#{post_path(c.post)}#comments']")
  end
end

# Helpers
def comments_list
  find(:xpath, "//div[contains(@class, 'comment-list')]/ol").text
end

def root_comments
  Post.first.root_comments
end
