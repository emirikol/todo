require 'spec_helper'
require 'webmock/rspec'
WebMock.disable!

Capybara.javascript_driver = :webkit
Capybara.default_driver = :rack_test

# Put your acceptance spec helpers inside spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}