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
  xpath_prefix = "//ul[@class='projects']/li"

  n.to_i.times do |i|
    case property
    when 'image with link'
      page.should have_xpath("#{xpath_prefix}/div[@class='item-image']/a/
                              img[contains(@src, '#{projects[i].image}')]")
      page.should have_xpath("#{xpath_prefix}/div[@class='item-image']/
                              a[contains(@href, '#{project_path(projects[i].category, projects[i])}')]")
    when 'link'
      page.should have_xpath("#{xpath_prefix}/div[@class='item-info']/p[@class='view']/
                              a[contains(@href, '#{project_path(projects[i].category, projects[i])}')]")
    when 'link to the category'
      link = find(:xpath, "#{xpath_prefix}/div[@class='item-info']/small/
                          a[contains(@href, '#{category_path(projects[i].category)}')]")
      link.text.should == projects[i].category.name
    when 'title'
      find(:xpath, "#{xpath_prefix}/div[@class='item-info']/h3/
                   a[contains(@href, '#{category_path(projects[i].category)}')]")
      title.text.should == projects[i].title
    when 'subtitle'
      all(:xpath, "#{xpath_prefix}/div[@class='item-info']/p").map do |n|
        n.text
      end.should include projects[i].subtitle
    when 'short date'
      all(:xpath, "#{xpath_prefix}/div[@class='item-info']/small").find_all do |n|
        n.text.include? I18n.l(projects[i].date, :format => :short)
      end.should_not be_empty
    else
      page.should have_content(projects[i].send(property))     
    end
  end
end

Then /^I should see the categories list$/ do
  page.should have_css('.categories')
end

Then /^I should see links to all the projects categories$/ do
  Project.all.each do |p|
    page.should have_xpath("//a[contains(@href, '#{category_path(p.category)}')]")
  end
end

Then /^I should see the contact teaser$/ do
  page.should have_css('.contact-us')
end

Then /^I should see the contact link$/ do
  page.should have_xpath("//a[@href='#{contact_path}']")
end