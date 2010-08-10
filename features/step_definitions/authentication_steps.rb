Given /^I am(.*)signed in$/ do |type|
  if type.blank?
    user = User.first || Factory.create(:user)

    visit('/users/sign_in')
    fill_in("user_email", :with => user.email)
    fill_in("user_password", :with => user.password)
    click_button("Sign in")
  else
    visit('/users/sign_out')
    visit('/users/sign_in')
  end
end
