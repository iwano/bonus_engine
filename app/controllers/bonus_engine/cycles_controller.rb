module BonusEngine
  class CyclesController < ApplicationController

    def index
      @cycles = Cycle.all
      render json: @cycles
    end
  end
end
