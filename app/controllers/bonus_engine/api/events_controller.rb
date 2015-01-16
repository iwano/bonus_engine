module BonusEngine
  module Api
    class EventsController < ApplicationController
      before_action :find_cycle

      def index
        @events = @cycle.events
      end

      def show
        @event = @cycle.events.find(params[:id])
      end

      private

      def find_cycle
        @cycle = Cycle.find(params[:cycle_id])
      end
    end
  end
end
