ENV["RACK_ENV"] ||= "development"
require 'bundler'
Bundler.require
require 'pry'
Dir[File.expand_path(File.join(File.expand_path(__FILE__), "..", "..", "config", "**", "*.rb"))].each {|file| require file}
Dir[File.expand_path(File.join(File.expand_path(__FILE__), "..", "server", "models", "**", "*.rb" ))].each {|file| require file }

module Stag; end
