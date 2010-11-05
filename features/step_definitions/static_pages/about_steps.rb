# encoding: UTF-8

Then /^I should see (.*) Linkedin profile link$/ do |handle|
  element = get_html_element(handle, 'linkedin')

  element.text.should == 'LinkedIn profile'
  element.native.attributes['href'].value.should == "http://pt.linkedin.com/in/#{handle}"
end

Then /^I should see (.*) Twitter link$/ do |handle|
  element = get_html_element(handle, 'twitter')

  element.text.should == 'follow me on Twitter'
  element.native.attributes['href'].value.should == "http://twitter.com/#{handle}"
end
