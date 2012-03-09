$:.unshift "."
require 'bundler'
Bundler.require


desc "Drop and migrate databases"
task :default => ['db:drop', 'db:migrate']

namespace :db do
  desc "drop databases at db/*.sqlite3"
  task :drop do
    `rm db/*.sqlite3`
  end

  desc "run migrations in db/migrations"
  task :migrate do
    [:development, :test].each do |environment|
      `sequel -m db/migrations sqlite://db/stag_#{environment}.sqlite3`
    end
  end
end


require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
end
