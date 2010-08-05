Then /^I should see the (\d+) latest tagged posts$/ do |n|
  posts = Post.tagged_with("rails").latest
  n.to_i.times { |i| inspect_post_html(posts[i].id, 'h2', Regexp.new(posts[i].title)) }
end

def inspect_post_html(id, element, regexp)
  position = find("#posts #post_#{id} #{element}").text =~ regexp
  position.should be_a_kind_of Fixnum
  position.should_not be_nil
end