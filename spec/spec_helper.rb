ENV["RAILS_ENV"] ||= 'test'

require 'simplecov'
SimpleCov.start do
  add_filter 'spec'
end

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!('rails')
end

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require './spec/models/object_creation_methods'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
  config.include(Capybara, :type => :integration)

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each, js: true) do
    current_path.should == current_path
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include(ObjectCreationMethods)

end
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:mapmyfitness] = OmniAuth::AuthHash.new({
  :provider => 'mapmyfitness',
  :uid => '123545',
  :info => {:first_name => "Jane", :last_name => "Doe", :email => "jane@example.com"},
  :credentials => {}
})
