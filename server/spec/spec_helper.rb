PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
require 'factory_girl'
require 'database_cleaner'

FactoryGirl.definition_file_paths = [ File.join(Padrino.root, 'spec', 'factories') ]
FactoryGirl.find_definitions

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  conf.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  conf.before(:each) do
    DatabaseCleaner.start
  end

  conf.after(:each) do
    DatabaseCleaner.clean
  end
end

def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
