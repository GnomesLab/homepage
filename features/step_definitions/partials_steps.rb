Then /^I should see the generic header$/ do
  header_test
end

# todo: missing social links

def header_test
  click_link "logo"
  visit path_to(request.headers['http_referer'])
  click_link "HOME"
end