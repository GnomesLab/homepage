Given /^Gnomeslab has ([0-9]+) categories with ([0-9]+) projects$/ do |category_count, projects_count|
  category_count.to_i.times do
    c = Factory.create(:category)
    projects_count.to_i.times do
      Factory.create(:project, :category => c)
    end
  end
end

Given /^I'm at one of the categories page$/ do
  @category = Category.first
  visit category_path(@category)
end

Then /^the visible projects must belong to the selected category$/ do
  peding
end

