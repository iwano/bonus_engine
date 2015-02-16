module BonusEngine
  class Cycle < ActiveRecord::Base
    validates_presence_of :name

    has_many :events
    has_many :cycle_users, class_name: "::BonusEngine::BonusEngineUser"
    has_many :users, through: :cycle_users
  end
end
