Given /^Gnomeslab have ([0-9]+) projects?$/ do |n|
  n.to_i.times { Factory.create(:project) }
end
