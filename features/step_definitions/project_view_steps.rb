Given /^Im on the project page$/ do
  @project = Project.first
  visit project_path(@project.category, @project)
end