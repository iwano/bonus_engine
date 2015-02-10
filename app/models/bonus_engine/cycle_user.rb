module BonusEngine
  class CycleUser < ActiveRecord::Base
    self.table_name = "bonus_engine_cycles_users"

    belongs_to :cycle
    belongs_to :user, class_name: BonusEngine.user_class.to_s
    has_many :points, foreign_key: 'giver_id'

    def can_assign?(points, event)
      current_balance(event) >= points &&
        event.maximum_points >= points
    end
    private

    def current_balance(event)
      event.budget - self.points.where(event_id: event.id).sum(:quantity)
    end
  end
end
