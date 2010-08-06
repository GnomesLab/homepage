Given /^Gnomeslab has ([0-9]+) projects?$/ do |n|
  n.to_i.times { Factory.create(:project) }
end

Given /^Gnomeslab has less than ([0-9]+) projects?$/ do |n|
  while Project.count >= n.to_i
    Project.last.delete
  end
end

Given /^all the projects contains a default image$/ do
  Project.all.each do |p|
    Factory.create(:image, :project => p)
  end
end

Then /^I should see the projects list with ([0-9]+) projects?$/ do |n|
  @projects_count = n.to_i
  page.should have_css('.projects', :count => 1)
  page.should have_css('.projects > li', :count => @projects_count)
end

When /^Gnomeslab has more than ([0-9]+) projects?$/ do |n|
  Project.count.should > n.to_i
end

Then /^I should(n\'t)? see the paginator$/ do |n|
  if n.blank?
    page.should have_css('.pagination')
  else
    page.should_not have_css('.pagination')
  end
end

Then /^the list should contain the titles with the respective links of each project$/ do
  paginated_projects.each do |p|
    title = find(:xpath, "#{project_xpath_prefix}/div[@class='item-info']/h3/
                          a[contains(@href, '#{category_path(p.category)}')]")

    title.should_not be_nil
    title.text.should == p.title
    pending
    test_click title
  end
end

Then /^the list should contain the subtitles of each project$/ do
  paginated_projects.each do |p|
    all(:xpath, "#{project_xpath_prefix}/div[@class='item-info']/p").map do |n|
        n.text
    end.should include p.subtitle
  end
end

Then /^the list should contain the short date of each project$/ do
  paginated_projects.each do |p|
    all(:xpath, "#{project_xpath_prefix}/div[@class='item-info']/small").find_all do |n|
      n.text.include? I18n.l(p.date, :format => :short)
    end.should_not be_empty
  end
end

Then /^the list should(n\'t)? contain the project image with a link to the project page$/ do |n|
  paginated_projects.each do |p|
    link = find(:xpath, "#{project_xpath_prefix}/div[@class='item-image']/
                         a[contains(@href, '#{project_path(p.category, p)}')]")

    if n.blank?
      link.should_not be_nil
      page.should have_xpath("#{project_xpath_prefix}/div[@class='item-image']/a/
                              img[contains(@src, '#{p.default_image.url}')]")
    else
      link.should be_nil
      page.should_not have_xpath("#{project_xpath_prefix}/div[@class='item-image']/a/img")
    end
  end
end

Then /^the list should contain an "([^"]*)" link for each project$/ do |t|
  paginated_projects.each do |p|
    link = find(:xpath, "#{project_xpath_prefix}/div[@class='item-info']/p[@class='view']/
                         a[contains(@href, '#{project_path(p.category, p)}')]")

    link.should_not be_nil
    link.text.should == t
  end
end

Then /^the list should contain the link to the project category$/ do
  paginated_projects.each do |p|
    link = find(:xpath, "#{project_xpath_prefix}/div[@class='item-info']/small/
                         a[contains(@href, '#{category_path(p.category)}')]")

    link.should_not be_nil
    link.text.should == p.category.name
    test_click link
  end
end

Then /^I should see the categories list$/ do
  page.should have_css('.categories')
end

Then /^I should see links to all the projects categories$/ do
  Project.all.each do |p|
    link = find(:xpath, "//div[contains(@class, 'categories')]/ul/li/
                         a[contains(@href, '#{category_path(p.category)}')]")
    link.should_not be_nil
    test_click link
  end
end

Then /^I should see the contact teaser$/ do
  page.should have_css('.contact-us')
end

Then /^I should see the contact link$/ do
  page.should have_xpath("//div[contains(@class, 'contact-us')]/div/p/a[@href='#{contact_path}']")
end

def project_xpath_prefix
  "//ul[@class='projects']/li"
end

def paginated_projects
  Project.limit(@projects_count)
end
