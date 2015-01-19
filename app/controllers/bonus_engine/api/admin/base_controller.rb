module BonusEngine
  module Api
    module Admin
      class BaseController < ApplicationController
        class AccessDenied < StandardError; end

        before_action :authorize_user

        private

        def authorize_user
          unless UserService.is_bonus_admin?(current_user)
            raise BonusEngine::Api::Admin::BaseController::AccessDenied
          end
        end
      end
    end
  end
end
