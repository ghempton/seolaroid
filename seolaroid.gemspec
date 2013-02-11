# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "seolaroid/version"

Gem::Specification.new do |s|
  s.name        = "seolaroid"
  s.version     = Seolaroid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gordon L. Hempton", "Alex Matchneer"]
  s.email       = ["ghempton@gmail.com"]
  s.summary     = "Turn-key SEO for single page javascript apps."

  s.add_dependency "activesupport"
  s.add_dependency "capybara"
  s.add_dependency "capybara-webkit"
  s.add_dependency "rest-client"
  s.add_dependency "sinatra"

  s.add_development_dependency "bundler", [">= 1.2.2"]

  s.files = %w(README.md LICENSE) + Dir["lib/**/*", "vendor/**/*"]

  s.require_paths = ["lib"]
end
