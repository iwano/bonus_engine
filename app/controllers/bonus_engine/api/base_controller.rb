module BonusEngine
  module Api
    class BaseController < ApplicationController
      def current_event
        @event ||= BonusEngine::Event.find params[:event_id]
      end
    end
  end
end
