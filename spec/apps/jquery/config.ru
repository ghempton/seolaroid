SEOLAROID_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..')).freeze
$LOAD_PATH << File.join(SEOLAROID_ROOT, 'lib')

require 'rake-pipeline'
require 'rake-pipeline/middleware'
require './app'

run JQueryApp