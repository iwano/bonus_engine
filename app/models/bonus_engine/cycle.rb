module BonusEngine
  class Cycle < ActiveRecord::Base
    validates_presence_of :name
  end
end