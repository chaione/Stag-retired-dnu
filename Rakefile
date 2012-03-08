$:.unshift "."

namespace :db do
  task :drop do
    `rm db/*.sqlite3`
  end

  task :migrate do
    [:development, :test].each do |environment|
      `sequel -m db/migrations sqlite://db/stag_#{environment}.sqlite3`
    end
  end
end

task :default do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:migrate'].invoke
end
