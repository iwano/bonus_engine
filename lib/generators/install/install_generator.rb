module BonusEngine
  module Generators
    class InstallGenerator < Rails::Generators::Base

      desc "Install BonusEngine"

      def copy_migrations
        puts 'Copying BonusEngine migrations'

        Dir.chdir(Rails.root) do
          `bundle exec rake bonus_engine:install:migrations`
        end
      end

      def run_migrations
        puts 'Running rake:db:migrate'

        `bundle exec rake db:migrate`
      end

    end
  end
end
