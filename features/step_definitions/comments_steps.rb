Given /^there are ([\d+]) comments$/ do |n|
  n.to_i.times { Factory.create(:comment, :post => Post.first) }
end

Then /^I should see ([\d+]) comment(?:s?)$/ do |n|
  ["//div[@id='comments']/h4[contains(@class, 'comments-count')]",
   "//div[@class='post-meta']/span[@class='right']/a[contains(@class, 'comments-count')]"].each do |xpath|
     comments_number = find(:xpath, xpath)
     comments_number.text.should include n
  end
end

Then /^the comments list should contain ([\d+]) comment(?:s?)$/ do |n|
  pending
  page.should have_css('.comment-list li', :count => n)
end