module BonusEngine
  module Api
    module Admin
      class BaseController < ApplicationController
        before_action :authorize_user

        private

        def authorize_user
          AuthorizationService.authorize_admin! current_user
        end
      end
    end
  end
end
