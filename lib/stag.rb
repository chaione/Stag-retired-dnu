require 'bundler'
Bundler.require
Dir[File.expand_path(File.join(File.expand_path(__FILE__), "..", "..", "config", "**", "*.rb"))].each {|file| require file}
Dir[File.expand_path(File.join(File.expand_path(__FILE__), "..", "server", "models", "**", "*.rb" ))].each {|file| require file }

module Stag; end