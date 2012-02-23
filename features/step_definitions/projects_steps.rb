Given /^I have the following Pivotal Tracker project$/ do |table|
  @existing_projects = table.hashes
end

Given /^the following projects$/ do |table|
  table.hashes.each do |params|
    Project.create(params)
  end
end

When /^I enter my project id$/ do
  step %Q{I fill in "Pivotal Tracker Project ID" with "#{@existing_projects.first['id']}"}
end

When /^I enter my project name$/ do
  step %Q{I fill in "Project name" with "#{@existing_projects.first['name']}"}
end

Then /^I should see (\d+) project$/ do |num|
  within("#projects") do
    page.should have_css(".project", :count => num.to_i)
  end
end

Then /^I should see my project name$/ do
  %Q{I should see "#{@existing_projects.first['name']}"}
end

