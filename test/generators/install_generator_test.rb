require "test_helper"
require "generators/rafinesque/install_generator"
class Rafinesque::InstallGeneratorTest < Rails::Generators::TestCase
  tests Rafinesque::Generators::InstallGenerator

  destination File.expand_path("../../tmp", __FILE__)

  setup :prepare_destination

  test "generates an initializer" do
    begin
      run_generator
      assert_file "config/initializers/rafinesque.rb"
    ensure
      FileUtils.rm_rf destination_root
    end
  end
end
