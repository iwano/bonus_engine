module BonusEngine
  class HomeController < ApplicationController
    def index
      render layout: 'bonus_engine/application'
    end
  end
end
