require "rabl"
require "es5-shim-rails"
require "rails-assets-angular"
require "rails-assets-angular-aria"
require "rails-assets-angular-animate"
require "rails-assets-angular-material"
require "rails-assets-angular-ui-router"
require "rails-assets-hammer.js"
require "rails-assets-iwano--ng-loading"
require "rails-assets-restangular"
require "rails-assets-react"

module BonusEngine
  class Engine < ::Rails::Engine
    isolate_namespace BonusEngine

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
