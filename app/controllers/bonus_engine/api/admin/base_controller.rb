module BonusEngine
  module Api
    module Admin
      class BaseController < ApplicationController
        class AccessDenied < StandardError; end

        before_action :authorize_user

        private

        def authorize_user
          unless current_user.roles.map(&:name).include?('bonus_admin')
            raise BonusEngine::Api::Admin::DummyController::AccessDenied
          end
        end
      end
    end
  end
end
