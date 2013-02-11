require 'bundler'
Bundler.require(:default, :test)

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
$LOAD_PATH << File.join(PROJECT_ROOT, 'lib')

require 'capybara/rspec'
require 'rack/test'
require 'seolaroid'

require 'rack/utils'

ENV['SEOLAROID_TEST_SERVER'] ||= 'http://127.0.0.1:9292/'

Capybara.register_driver :bot do |app|
  driver = Capybara::RackTest::Driver.new(app, headers: {"HTTP_USER_AGENT" => "googlebot"})
  def driver.needs_server?
    true
  end
  driver
end

Capybara.register_driver :human do |app|
  driver = Capybara::RackTest::Driver.new(app)
  def driver.needs_server?
    true
  end
  driver
end

RSpec.configure do |c|

  after do
    Capybara.reset_sessions!
  end

end
