module BonusEngine
  class UsersController < ApplicationController
    before_action :find_user, only: :show

    def index
      @users = BonusEngine.user_class.all
    end

    def show; end

    private

    def find_user
      @user = BonusEngine.user_class.find(params[:id])
    end
  end
end
