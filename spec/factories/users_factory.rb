# encoding: UTF-8

Factory.define(:user) do |u|
  u.name "John Doe"
  u.sequence(:email) { |n| "john#{n}@doe.com" }
  u.password "123456"
end