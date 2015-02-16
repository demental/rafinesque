require "rails/generators"
module Rafinesque
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../rafinesque", __FILE__)

      desc "Creates a Rafinesque initializer in your application config/ dir."

      def copy_initializer
        copy_file "initializer.rb", "config/initializers/rafinesque.rb"
      end
    end
  end
end
