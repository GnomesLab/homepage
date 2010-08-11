Factory.define :project do |p|
  p.sequence(:title)       { |n| "project#{n} title"          }
  p.sequence(:subtitle)    { |n| "project#{n} subtitle"       }
  p.sequence(:description) { |n| "project#{n} description"    }
  p.sequence(:date)        { |n| n.weeks.ago.to_date          }
  p.sequence(:url)         { |n| "http://www.project#{n}.com" }
  p.association            :category
end
