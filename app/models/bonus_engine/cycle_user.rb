module BonusEngine
  class CycleUser < ActiveRecord::Base
    self.table_name = "bonus_engine_cycles_users"

    belongs_to :cycle
    belongs_to :user
  end
end
