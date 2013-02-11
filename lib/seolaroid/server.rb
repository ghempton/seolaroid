require 'sinatra'
require 'capybara-webkit'

module Seolaroid
  class Server < Sinatra::Base

    def browser
      @browser ||= Capybara::Webkit::Browser.new(Capybara::Webkit::Connection.new({}))
    end

    get '/' do
      browser.visit params[:url]
      browser.body
    end

  end
end