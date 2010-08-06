Given /^Im on the project page$/ do
  @project = Project.first
  @category = @project.category
  visit project_path(@project.category, @project)
end

Given /^the project has more than ([0-9]*) image?$/ do |n|
  @project.images.count > n.to_i
end

Then /^the breadcrumb should contain a link to the current project$/ do
  link = find(:xpath, "//ul[@id='breadcrumb']/li/a[contains(@href, #{project_path(@category, @project)})]")
  link.should_not be_nil
  test_click link
end
