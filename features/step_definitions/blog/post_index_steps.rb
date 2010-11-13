# encoding: UTF-8

Then(/^I should see the (\d+) latest posts$/) do |n|
  posts = Post.published.latest

  n.to_i.times { |i| inspect_post_html(posts[i].id, 'h2', Regexp.new(posts[i].title)) }
end

Then(/^I should see the (\d+) latest posts (.*)$/) do |n, attribute|
  posts = Post.published.latest

  n.to_i.times do |i|
    case attribute
    when "date"
      inspect_post_html posts[i].id, 'h2', Regexp.new(ERB::Util.h(I18n.l(posts[i].published_at, :format => :long)))
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
      inspect_post_html posts[i].id, '.comments', Regexp.new("#{posts[i].comments.count} comments")
    when "delete link"
      find("#post_#{posts[i].id} a.delete").text.should == "Destroy"
    when "edit link"
      inspect_post_html posts[i].id, '.comments p a.edit', Regexp.new("Edit")
    else
      inspect_post_html posts[i].id, 'h2', Regexp.new(ERB::Util.h(posts[i].send(attribute.to_sym)))
    end
  end
end

Then(/^I should see the post (.*)$/) do |attribute|
  Then "I should see the 1 latest posts #{attribute}"
end

Then(/^I should not see the (\d+) latest posts (.*)$/) do |n, attribute|
  posts = Post.published.latest

  n.to_i.times do |i|
    case attribute
    when "delete link"
      page.has_no_selector?("#posts #post_#{posts[i].id} a.delete")
    when "edit link"
      page.has_no_selector?("#posts #post_#{posts[i].id} #comments p a#edit_post_#{posts[i].id}_link")
    end
  end
end

Then(/^I should be able to follow to the (\d+) latest posts pages$/) do |n|
  posts = Post.published.latest
  n.to_i.times do |i|
    page.should have_css("#posts .post:nth-child(#{i+1}) a[href='#{friendly_post_path(posts[i])}']")
  end
end

Then(/^I should not see the post (.*)$/) do |attribute|
  Then "I should not see the 1 latest posts #{attribute}"
end

Then(/^I should see the posts paginator$/) do
  posts = Post.published.latest
  position = find("#posts div.pagination").text =~ Regexp.new("< Prev|1|2|3|4|5|Next >")
  position.should == 0
end

Then(/^I should see the recent posts title$/) do
  position = find("#recent_posts h2").text =~ /Recent Posts/
  position.should == 0
end

Then(/^I should see the (\d+) most recent post titles$/) do |n|
  post = Post.published.latest

  n.to_i.times do |i|
    regexp = Regexp.new(ERB::Util.h(post[i].title))
    position = find(:xpath,
                    "//div[@id='recent_posts']/div[@class='entry']/ul/li[#{i+1}]").text =~ regexp
    position == 0
  end
end

Then(/^I should see the popular posts title$/) do
  position = find("#popular_posts h2").text =~ /Popular Posts/
  position.should == 0
end

Then(/^I should see the (\d+) most popular post titles$/) do |n|
  post = Post.published.latest

  n.to_i.times do |i|
    regexp = Regexp.new(ERB::Util.h(post[i].title))
    position = find(:xpath,
                    "//div[@id='popular_posts']/div[@class='entry']/ul/li[#{i+1}]").text =~ regexp
    position == 0
  end
end

Then(/^I should see archives$/) do
  position = find("#archives h2").text =~ /Archives/
  position.should == 0
end

Then(/^I should( not)? see (\d+)?\s?unpublished posts$/) do |n, d|
  count = d.blank? ? 1 : count.to_i
  posts = n.blank? ? Post.latest.limit(count) : Post.published.latest.limit(count)
  posts.each do |p|
    Then "I should see \"#{p.title}\""
  end
end