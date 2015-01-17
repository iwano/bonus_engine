module BonusEngine
  module Api
    module Admin
      class UsersController < BaseController
        before_action :find_user, only: :show

        def index
          @users = ::UserService.all
        end

        def show; end

        private

        def find_user
          @user = ::UserService.find(params[:id])
        end
      end
    end
  end
end
