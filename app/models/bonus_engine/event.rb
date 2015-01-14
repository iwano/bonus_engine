module BonusEngine
  class Event < ActiveRecord::Base
    belongs_to :cycle

    validates_presence_of :name, :opens_at, :closes_at
  end
end
