Then /^I should see the post's (.*)$/ do |attribute|
  post = Post.first

  case attribute
  when "user" then page.should have_content post.user.name
  when "date" then page.should have_content I18n.l(post.created_at, :format => :long)
  when "body" then page.should have_content post.body
  else
    page.should have_content post.send(attribute.to_sym)
  end
end

Then /^I should see the New comment internal link$/ do
  pending
end
