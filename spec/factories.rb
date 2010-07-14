Factory.define(:comment) do |c|
  c.sequence(:name) { |n| "John#{n}" }
  c.sequence(:email) { |n| "some#{n}@email.com" }
  c.sequence(:website) { |n| "gnomeslab#{n}.com" }
  c.sequence(:body) { |n| "This is soma#{n}."}
end

Factory.define(:post) do |p|
  c.sequence(:name) { |n| "John#{n}" }
  c.sequence(:title) { |n| "title#{n}" }
  c.sequence(:body) { |n| "This is soma#{n}."}
  c.tags "Nerdy, Geeky, Noobie"
end

Factory.define(:contact) do |f|
  f.sequence(:firstname) { |n| "John#{n}" }
  f.sequence(:lastname) { |n| "Doe#{n}" }
  f.sequence(:email) { |n| "some#{n}@email.com" }
  f.sequence(:company) { |n| "gnomeslab#{n}.com" }
  f.sequence(:message) { |n| "There is no spoon#{n}."}
end

#dummy users