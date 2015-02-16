require 'rails/generators'

module Rafinesque
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../../../rafinesque', __FILE__)

      def start
        copy_file 'initializer.rb', 'config/initializers/rafinesque.rb'
      end
    end
  end
end
