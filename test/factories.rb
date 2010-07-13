Factory.define(:comment) do |c|
  c.sequence(:name) { |n| "John#{n}" }
  c.sequence(:email) { |n| "some@email#{n}.com" }
  c.sequence(:website) { |n| "gnomeslab#{n}.com" }
  c.sequence(:body) { |n| "This is soma#{n}."}
end

Factory.define(:post) do |p|
  c.sequence(:name) { |n| "John#{n}" }
  c.sequence(:title) { |n| "title#{n}" }
  c.sequence(:body) { |n| "This is soma#{n}."}
end