require 'rails_helper'

module BonusEngine
  describe Event do
    it { should belong_to :cycle }
    it { should validate_presence_of :name }
    it { should validate_presence_of :opens_at }
    it { should validate_presence_of :closes_at }
    it { should validate_presence_of :maximum_points }
    it { should validate_presence_of :msg_required }
    it { should validate_presence_of :budget }
  end
end
