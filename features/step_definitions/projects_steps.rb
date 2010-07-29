Given /^(?:.*) has ([0-9]+) projects?$/ do |n|
  n.to_i.times { Factory.create(:project) }
end

Given /^(?:.*) has less than ([0-9]+) projects?$/ do |n|
  while Project.count >= n.to_i
    Project.last.delete
  end
end

Then /^I should see the projects list with ([0-9]+) projects?$/ do |n|
  page.should have_css('.projects', :count => 1)
  page.should have_css('.projects > li', :count => n.to_i)
end

When /^(?:.*) has more than ([0-9]+) projects?$/ do |n|
  Project.count.should > n.to_i
end

Then /^I should(n\'t)? see the paginator$/ do |n|
  if n.blank?
    page.should have_css('.pagination')
  else
    page.should_not have_css('.pagination')
  end
end

# TODO refactor please
Then /^I should see the (.*) of ([0-9]+) projects$/ do |property, n|
  projects = Project.all

  n.to_i.times do |i|
    case property
    when 'image'
      page.should have_xpath("//img[contains(@src, '#{projects[i].image}')]")
    when 'link'
      page.should have_xpath("//a[contains(@href, '#{project_path(projects[i])}')]")
    when 'short date'
      page.should have_content((I18n.l projects[i].date, :format => :short))
    else
      page.should have_content(projects[i].send(property))      
    end
  end
end
