Factory.define(:post) do |p|
  p.user { |user| user.association(:user, :name => "John Doe") }
  p.sequence(:title) { |n| "title#{n}" }
  p.sequence(:body) { |n| "This is soma#{n}."}
  p.views 3452
  p.visible true
  # p.tags "Nerdy, Geeky, Noobie"
end