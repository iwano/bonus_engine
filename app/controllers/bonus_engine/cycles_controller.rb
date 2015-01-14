module BonusEngine
  class CyclesController < ApplicationController
    before_action :find_cycle, only: [:show, :update, :destroy]

    def create
      @cycle = Cycle.new(cycle_params)
      if @cycle.save
        render :show, cycle: @cycle, status: :created
      else
        render json: @cycle.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @cycle.destroy
      render nothing: true, status: :ok
    end

    def index
      @cycles = Cycle.all
    end

    def update
      if @cycle.update(cycle_params)
        render :show, status: :ok
      else
        render json: @cycle.errors, status: :unprocessable_entity
      end
    end

    def show; end

    private

    def find_cycle
      @cycle = Cycle.find(params[:id])
    end

    def cycle_params
      params.require(:cycle).permit(:name)
    end
  end
end
