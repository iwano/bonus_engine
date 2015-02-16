require 'rails_helper'

module BonusEngine
  describe BonusEngineUser do
    it { should belong_to(:cycle) }
    it { should belong_to(:user) }
  end
end
