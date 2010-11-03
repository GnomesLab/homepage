# encoding: UTF-8

Factory.define :post do |p|
  p.association :user, :factory => :user
  p.sequence(:title) { |n| "Post Title#{n}" }
  p.sequence(:body) { |n| "This is the #{n}th post. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer dictum, neque ut imperdiet pellentesque, nulla tellus tempus magna, sed consectetur orci metus a justo. Aliquam ac congue nunc. Mauris a tortor ut massa egestas tempus. Pellentesque tincidunt fermentum diam sagittis ullamcorper. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer dictum."}
  p.sequence(:views) { |n| n }
  p.tag_list "rails, ruby, regexp"
end

Factory.define :published_post, :parent => :post do |p|
  p.sequence(:published_at) { |n| n.minutes.ago }
end