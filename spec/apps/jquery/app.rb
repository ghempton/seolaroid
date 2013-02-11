require 'sinatra/base'
require 'seolaroid'
require "rake-pipeline/middleware"

class JQueryApp < Sinatra::Base
  use Seolaroid::Middleware, server_url: ENV['SEOLAROID_TEST_SERVER']
  use Rake::Pipeline::Middleware, File.join(File.dirname(__FILE__), "Assetfile")

  get '/dynamic' do
    send_file File.join(settings.public_folder, 'index.html')
  end
end