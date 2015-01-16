module BonusEngine
  module Api
    class CyclesController < ApplicationController
      before_action :find_cycle, only: :show

      def index
        @cycles = Cycle.all
      end

      def show; end

      private

      def find_cycle
        @cycle = Cycle.find(params[:id])
      end
    end
  end
end
