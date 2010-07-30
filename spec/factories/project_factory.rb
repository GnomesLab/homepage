Factory.define :project do |p|
  p.sequence(:title)    { |n| "project#{n} title"         }
  p.sequence(:subtitle) { |n| "project#{n} subtitle"      }
  p.sequence(:image)    { |n| "content/projects/#{n}.jpg" }
  p.sequence(:date)     { |n| n.weeks.ago.to_date         }
  p.association         :category
end
