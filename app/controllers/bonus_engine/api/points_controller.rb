module BonusEngine
  module Api
    class PointsController < BaseController
      before_filter :check_balance, only: [:create]

      def create
        @point = BonusEngine::Point.new create_point_params
        if @point.save
          stats = @event.stats_for current_user
          @balance = stats[:balance]
          @pending = stats[:pending]
          render :create, status: :created
        else
          render json: @point.errors, status: :unprocessable_entity
        end
      end

      def update
        point = BonusEngine::Point.find params[:id]

        if point.update(create_point_params)
          render nothing: true, status: :ok
        else
          render json: point.errors, status: :unprocessable_entity
        end

      end

      private

      def create_point_params
        create_params = params.permit(:receiver_id, :event_id, :quantity, :message)
        create_params[:giver_id] = current_user.id
        create_params
      end

      def check_balance
        unless current_user.can_assign? params[:quantity].to_i, current_event
          render json: {errors:{balance: 'You might be breaking the balance of the universe'}}, status: :unprocessable_entity
        end
      end

      def current_event
        @event = BonusEngine::Event.find params[:event_id]
      end
    end
  end
end
