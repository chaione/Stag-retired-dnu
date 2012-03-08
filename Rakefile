$:.unshift "."

# require 'lib/stag'

def drop
  `rm db/*.sqlite3`
end

def migrate
  [:development, :test].each do |environment|
    `sequel -m db/migrations sqlite://db/stag_#{environment}.sqlite3`
  end
end


task :default do
  drop
  migrate
end