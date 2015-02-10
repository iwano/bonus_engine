module BonusEngine
  class Event < ActiveRecord::Base
    belongs_to :cycle
    has_many :points

    validates_presence_of :name, :opens_at, :closes_at
  end
end
