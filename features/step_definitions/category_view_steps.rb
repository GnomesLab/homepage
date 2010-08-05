Given /^Gnomeslab has ([0-9]+) categories with ([0-9]+) projects$/ do |category_count, projects_count|
  category_count.to_i.times do
    c = Factory.create(:category)
    projects_count.to_i.times do
      Factory.create(:project, :category => c)
    end
  end
end

Given /^I'm at one of the categories page$/ do
  @category = Category.first
  visit category_path(@category)
end

Then /^I should see the breadcrumb$/ do
  page.should have_css('#breadcrumb')
end

Then /^the breadcrumb should contain a link to the projects page$/ do
  link = find(:xpath, "//ul[@id='breadcrumb']/li/a[contains(@href, #{projects_path})]")
  link.should_not be_nil
  test_click link
end

Then /^the breadcrumb should contain a link to the current category$/ do
  link = find(:xpath, "//ul[@id='breadcrumb']/li/a[contains(@href, #{category_path(@category)})]")
  link.should_not be_nil
  test_click link
end

Then /^all the projects should belong to the current category$/ do
  current_category_path = category_path(@category)

  paginated_projects.each do |p|
    page.should have_xpath("#{project_xpath_prefix}/div[@class='item-info']/small/
                           a[contains(@href, '#{current_category_path}')]")
  end
end

When /^the category has more than ([0-9]+) projects?$/ do |n|
  @category.projects_count.should > n.to_i
end

Given /^the category has less than ([0-9]+) projects?$/ do |n|
  while @category.projects.count >= n.to_i
    @category.projects.last.delete
  end
end

Given /^I see ([0-9]*) projects?$/ do |n|
  @projects_count = n.to_i
end