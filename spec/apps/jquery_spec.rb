require "spec_helper"

require File.join(File.dirname(__FILE__), 'jquery', 'app.rb')

Capybara.app = Rack::ShowExceptions.new(JQueryApp.new)

feature JQueryApp do

  let(:url) { '/' }

  context "with a bot user agent", driver: :bot do

    scenario "should render javascript content" do
      visit '/'

      page.source.should =~ /static content/
      page.source.should =~ /dynamic content/
      page.source.should_not =~ /will be replaced/
    end

  end

  context "without a bot user agent", driver: :human do

    scenario "should not render javascript content" do
      visit '/'

      page.source.should =~ /static content/
      page.source.should_not =~ /dynamic content/
      page.source.should =~ /will be replaced/
    end

  end

end