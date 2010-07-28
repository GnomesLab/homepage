Factory.define :project do |p|
  p.sequence(:title)    { |n| "project#{n} title"                   }
  p.sequence(:subtitle) { |n| "project#{n} subtitle"                }
  p.sequence(:image)    { |n| "../images/content/projects/#{n}.jpg" }
  p.sequence(:date)     { |n| n.weeks.ago.to_date                   }
end