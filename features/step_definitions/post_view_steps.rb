Then /^There are unpublished posts$/ do
  2.times { Factory.create(:post) }
end

Then /^I should see the related posts title$/ do
  position = find("#related_posts h2").text =~ /Related Posts/
  position.should == 0
end

Then /^I should see the (\d+) most popular related post titles$/ do |n|
  Post.first.related.each_with_index do |related, i|
    regexp = Regexp.new(ERB::Util.h(related.title))
    node = find(:xpath, "//div[@id='related_posts']/div[@class='entry']/ul/li[#{i+1}]")
    node.text.should =~ regexp
  end
end