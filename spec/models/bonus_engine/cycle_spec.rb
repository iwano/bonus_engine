require "rails_helper"

module BonusEngine
  describe Cycle do
    it { should validate_presence_of :name }
  end
end