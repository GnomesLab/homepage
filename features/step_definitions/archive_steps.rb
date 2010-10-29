Then /^I should see the box title set to "([^"]*)"$/ do |title|
  find("#archives h2").text.should == title
end

Then /^the archived years "([^"]*)" should be available$/ do |years_string|
  years = years_string.split(', ')
  
  years.each_with_index do |year, i|
    find(:xpath, "//div[@id='archives']/ul/li[#{i + 1}]/a[2]").text.should == year
  end
end

Then /^"([^"]*)" should be the active archive year$/ do |year|
  find(:xpath, "//div[@id='archives']/ul/li[@class='active']/a[2]").text.should == year
end

Then /^I should see the correct archive tree structure$/ do
  Post.archived_months(:month_names => :long).each_with_index do |v, i|
    expected_value = "#{v[0]} (#{v[1]})"

    find(:xpath,
         "//div[@id='archives']/ul/li[@class='active']/ul/li[#{i + 1}]").text.should == expected_value
  end
end

When /^I follow the active year archive link$/ do
  find("#archives ul li.active a[2]").click
end

Then /^I should see that year archived posts title$/ do
  find("#posts > h2").text.should include Time.now.year.to_s
end

When /^I follow the first month of the active year$/ do
  find("#archives ul li.active ul li[1] a").click
end

Then /^I should see that month archived posts title$/ do
  find("#posts > h2").text.should include "#{Date::MONTHNAMES[Time.now.month]}, #{Time.now.year}"
end
