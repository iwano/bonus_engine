module BonusEngine
  class CycleUser < ActiveRecord::Base
    self.table_name = "bonus_engine_cycles_users"

    belongs_to :cycle
    belongs_to :user, class_name: BonusEngine.user_class.to_s
    has_many :points, foreign_key: 'giver_id'

    def can_assign?(points, event)
      event.stats_for(self)[:balance] >= points &&
        event.maximum_points >= points
    end
  end
end
