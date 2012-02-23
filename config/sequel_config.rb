DatabaseFile = File.expand_path(File.join(File.expand_path(__FILE__), "..", "..", "db", "stag_#{ENV['RACK_ENV']}.sqlite3"))

DB = Sequel.sqlite(DatabaseFile)