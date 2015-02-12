module BonusEngine
  module Api
    class PointsController < BaseController
      before_action :check_budget, only: [:create]
      before_action :check_update_budget, only: [:update]

      def create
        @point = BonusEngine::Point.new point_params
        if @point.save
          set_stats
          render :create, status: :created
        else
          render json: @point.errors, status: :unprocessable_entity
        end
      end

      def update
        @point = BonusEngine::Point.find params[:id]

        if @point.update(point_params)
          set_stats
          render :update, status: :ok
        else
          render json: @point.errors, status: :unprocessable_entity
        end

      end

      private

      def check_budget
        unless budget_service.available_budget? params[:quantity].to_i
          render json: {
                          errors: { balance: 'You might be breaking the balance of the universe' }
                       }, status: :unprocessable_entity
        end
      end

      def check_update_budget
        unless budget_service.available_update_budget? params[:quantity].to_i, params[:id]
          render json: {
                          errors: { balance: 'You might be breaking the balance of the universe' }
                       }, status: :unprocessable_entity
        end
      end

      def point_params
        create_params = params.permit(:receiver_id, :event_id, :quantity, :message)
        create_params[:giver_id] = current_user.id
        create_params
      end

      def set_stats
        stats = current_event.stats_for current_user
        @balance, @pending = stats.values_at 'balance', 'pending'
      end

      def budget_service
        ::BudgetService.new current_event, current_user
      end
    end
  end
end
