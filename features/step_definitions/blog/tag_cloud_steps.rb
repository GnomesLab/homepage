Then /^I should see the tag cloud title$/ do
  position = find("#tag_cloud_title h5").text =~ /Tag Cloud/
  position.should == 0
end

Then /^I should see the (\d+) first cloud tags$/ do |n|
  n.to_i.times do |i|
    position = find(:xpath, "//div[@id='tag_cloud']/a[#{i+1}]").text =~ Regexp.new(Post.cloud_tags[i].name)
    position.should == 0
  end
end