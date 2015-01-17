module BonusEngine
  module Api
    class BaseController < ApplicationController
      class AccessDenied < StandardError; end

      before_action :authorize_user

      private

      def authorize_user
        unless current_user
          raise BonusEngine::Api::BaseController::AccessDenied
        end
      end
    end
  end
end
