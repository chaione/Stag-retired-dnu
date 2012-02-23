# require 'bundler'
# Bundler.require

$: << "." << "lib" << "lib/server"

require 'lib/stag'
require 'server'

use Rack::Reloader
run Stag::Server