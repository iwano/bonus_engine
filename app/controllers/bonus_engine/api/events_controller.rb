module BonusEngine
  module Api
    class EventsController < ApplicationController
      before_action :find_cycle

      def index
        @events = @cycle.events
      end

      private

      def find_cycle
        @cycle = Cycle.find(params[:cycle_id])
      end
    end
  end
end
