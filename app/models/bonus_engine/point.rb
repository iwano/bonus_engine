module BonusEngine
  class Point < ActiveRecord::Base
    belongs_to :event
    belongs_to :giver, class_name: '::BonusEngine::CycleUser'
    belongs_to :receiver, class_name: '::BonusEngine::CycleUser'

    validates_presence_of :quantity, :receiver_id, :giver_id
    validates_numericality_of :quantity, greater_than: 0
  end
end
