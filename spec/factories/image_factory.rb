Factory.define :image do |i|
  i.sequence(:title) { |n| "image#{n} title"           }
  i.sequence(:url)   { |n| "content/projects/#{n}.jpg" }
  i.association      :project
end
