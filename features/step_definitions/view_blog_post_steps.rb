Then /^I should see the post's (.*)$/ do |attribute|
  post = Post.first

  case attribute
  when "user" then page.should have_content post.user.name
  when "date" then page.should have_content I18n.l(post.created_at, :format => :long)
  when "body" then page.should have_content post.body
  else
    page.should have_content post.send(attribute.to_sym)
  end
end

Then /^I should see the New comment internal link$/ do
  pending
end

Then /^I should see the related posts title$/ do
  position = find("#related_posts h2").text =~ /Related Posts/
  position.should == 0
end

Then /^I should see the (\d+) most popular related post titles$/ do |n|
  post = Post.latest

  n.to_i.times do |i|
    regexp = Regexp.new(ERB::Util.h(post[i].title))
    position = find(:xpath,
                    "//div[@id='related_posts']/div[@class='entry']/ul/li[#{i+1}]").text =~ regexp
    position == 0
  end
end