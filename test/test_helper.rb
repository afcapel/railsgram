ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

require "active_storage/fixture_set"
ActiveStorage::FixtureSet.file_fixture_path = Rails.root.join("test/fixtures/files").to_s

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Do not print all fixtures when a variable is not defined in a test
  def inspect
    "Test #{self.class.name}"
  end
end
