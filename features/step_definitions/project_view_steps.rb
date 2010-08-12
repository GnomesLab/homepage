Given /^Im on the project page$/ do
  @project = Project.first
  @category = @project.category
  visit project_path(@project.category, @project)
end

Given /^the project has ([0-9]*) images?$/ do |n|
  n.to_i.times { Factory.create(:image, :project => Project.first) }
end

Given /^the project has more than ([0-9]*) image?$/ do |n|
  @project.images.count.should > n.to_i
end

Given /^the project has less than ([0-9]*) image?$/ do |n|
  while @project.images.count >= n.to_i
    @project.images.last.delete
  end
end

Then /^the breadcrumb should contain a link to the current project$/ do
  link = find(:xpath, "//ul[@id='breadcrumb']/li/a[contains(@href, #{project_path(@category, @project)})]")
  link.should_not be_nil
  test_click link
end

Then /^I should(n\'t)? see the project rotator$/ do |n|
  if n.blank?
    page.should have_css('.project-slider .project-slider-holder', :count => 1)
  else
    page.should_not have_css('.project-slider .project-slider-holder', :count => 1)
  end
end

Then /^I should see the rotator ([a-z]*) button$/ do |button|
  page.should have_xpath("//div[@class='project-slider']/div[@class='slider-nav']/
                          a[contains(child::text(),'#{button}')]")
end

Then /^the rotator should contain all the project previews$/ do
  @project.previews.each do |p|
    page.should have_xpath("//div[@class='project-slider']/div[@class='project-slider-holder']/ul/
                            li/img[contains(@src,'#{p.url}')]")
  end
end

Then /^I should see the project title$/ do
  title = find(:xpath, "//h2[@class='border']")
  title.should_not be_nil
  title.text.should include @project.title
end

Then /^I should see the project long date$/ do
  date = find(:xpath, "//h2[@class='border']/small[@class='right']")
  date.should_not be_nil
  date.text.should == I18n.l(@project.date, :format => :long)
end

Then /^I should see the project description$/ do
  description = find(:xpath, "//div[@class='entry']")
  description.should_not be_nil
  description.text.should include @project.description
end

Then /^I should see the project site link$/ do
  link = find(:xpath, "//div[@class='entry']/p[@class='nav']/a[@href='#{@project.url}']")
  link.should_not be_nil
  link.text.should == 'Launch the Site'
end