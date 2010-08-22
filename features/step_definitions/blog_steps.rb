Then /^I should see the (\d+) latest posts$/ do |n|
  posts = Post.published.latest

  n.to_i.times { |i| inspect_post_html(posts[i].id, 'h2', Regexp.new(posts[i].title)) }
end

Then /^I should see the (\d+) latest posts (.*)$/ do |n, attribute|
  posts = Post.published.latest

  n.to_i.times do |i|
    case attribute
    when "date"
      inspect_post_html posts[i].id, 'h2', Regexp.new(ERB::Util.h(I18n.l(posts[i].created_at, :format => :long)))
    when "body"
      inspect_post_html posts[i].id, '.entry', Regexp.new(ERB::Util.h(posts[i].body))
    when "creator name"
      inspect_post_html posts[i].id, '#created_by', Regexp.new(ERB::Util.h(posts[i].user.name))
    when "tags"
      # FIXME: this requires a revision
      inspect_post_html posts[i].id, "#tag_#{posts[i].id}_0", Regexp.new(ERB::Util.h(posts[i].tag_list[0]))
      inspect_post_html posts[i].id, "#tag_#{posts[i].id}_1", Regexp.new(ERB::Util.h(posts[i].tag_list[1]))
      inspect_post_html posts[i].id, "#tag_#{posts[i].id}_2", Regexp.new(ERB::Util.h(posts[i].tag_list[2]))
      # inspect_post_html posts[i].id, '#post_tags', Regexp.new("Tags: #{['/.*/', '/.*/', '/.*/'].join(' ')}")
    when "comment count"
      inspect_post_html posts[i].id, '#comments', Regexp.new("Comments: 0")
    when "delete button"
      find("#posts #post_#{posts[i].id} form input.button").value.should == "Delete"
    when "edit link"
      inspect_post_html posts[i].id, '#comments p a', Regexp.new("Edit post")
    else
      inspect_post_html posts[i].id, 'h2', Regexp.new(ERB::Util.h(posts[i].send(attribute.to_sym)))
    end
  end
end

Then /^I should not see the (\d+) latest posts (.*)$/ do |n, attribute|
  posts = Post.published.latest

  n.to_i.times do |i|
    case attribute
    when "delete button"
      find("#posts #post_#{posts[i].id} form input.button").should be_nil
    when "edit link"
      find("#posts #post_#{posts[i].id} #comments p a#edit_post_#{posts[i].id}_link").should be_nil
    end
  end
end

Then /^I should see the posts paginator$/ do
  posts = Post.published.latest
  position = find("#posts div.pagination").text =~ Regexp.new("< Prev|1|2|3|4|5|Next >")
  position.should == 0
end

Then /^I should see the recent posts title$/ do
  position = find("#recent_posts h2").text =~ /Recent Posts/
  position.should == 0
end

Then /^I should see the (\d+) most recent post titles$/ do |n|
  post = Post.published.latest

  n.to_i.times do |i|
    regexp = Regexp.new(ERB::Util.h(post[i].title))
    position = find(:xpath,
                    "//div[@id='recent_posts']/div[@class='entry']/ul/li[#{i+1}]").text =~ regexp
    position == 0
  end
end

Then /^I should see the popular posts title$/ do
  position = find("#popular_posts h2").text =~ /Popular Posts/
  position.should == 0
end

Then /^I should see the (\d+) most popular post titles$/ do |n|
  post = Post.published.latest

  n.to_i.times do |i|
    regexp = Regexp.new(ERB::Util.h(post[i].title))
    position = find(:xpath,
                    "//div[@id='popular_posts']/div[@class='entry']/ul/li[#{i+1}]").text =~ regexp
    position == 0
  end
end

Then /^I should see archives$/ do
  position = find("#archives h2").text =~ /Archives/
  position.should == 0
end
