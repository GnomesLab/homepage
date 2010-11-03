# encoding: UTF-8

Then /^I should see the (\d+) latest tagged posts$/ do |n|
  posts = Post.tagged_with("rails").latest
  n.to_i.times { |i| inspect_post_html(posts[i].id, 'h2', Regexp.new(posts[i].title)) }
end