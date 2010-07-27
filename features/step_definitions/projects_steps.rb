Given /^(?:.*) have ([0-9]+) projects?$/ do |n|
  n.to_i.times { Factory.create(:project) }
end

Given /^(?:.*) have less than ([0-9]+) projects?$/ do |n|
  while Project.count >= n.to_i
    Project.last.delete
  end
end

Then /^I should see the projects list with ([0-9]+) projects?$/ do |n|
  page.should have_css('.projects', :count => 1)
  page.should have_css('.projects > li', :count => n.to_i)
end

When /^(?:.*) have more than ([0-9]+) projects?$/ do |n|
  Project.count.should > n.to_i
end
