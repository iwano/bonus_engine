module BonusEngine
  class Event < ActiveRecord::Base
    belongs_to :cycle
    has_many :points

    validates_presence_of :name, :opens_at, :closes_at, :budget, :maximum_points, :msg_required
    validates_numericality_of :budget, greater_than: 0
    validates_numericality_of :maximum_points, greater_than: 0

    after_initialize

    def stats_for(user)
      user_points = user.given_points.where(event_id: self.id)
      {
        balance: self.budget - user_points.sum(:quantity),
        pending: self.minimum_people - user_points.count
      }
    end
  end
end
