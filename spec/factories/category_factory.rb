Factory.define :category do |p|
  p.sequence(:name) { |n| "category #{n}" }
end
