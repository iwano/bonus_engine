module BonusEngine
  module Api
    class PointsController < BaseController
      def create
        point = BonusEngine::Point.new create_point_params

        if point.save
          render nothing: true, status: 200
        else
          render json: point.errors, status: :unprocessable_entity
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
    end
  end
end
