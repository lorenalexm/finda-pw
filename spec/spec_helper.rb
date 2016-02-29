ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'tilt/coffee'
require_relative '../app'

module RSpecMixin
  include Rack::Test::Methods

  def app
    FindaPw
  end
end

Capybara.app = FindaPw
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include RSpecMixin
  config.include Capybara::DSL, feature: true
  config.include Capybara::RSpecMatchers, feature: true
end
