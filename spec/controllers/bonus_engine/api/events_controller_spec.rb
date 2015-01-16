require 'rails_helper'

describe BonusEngine::Api::EventsController do
  render_views

  describe "#index" do
    let!(:cycle) { create :cycle }
    let!(:cycle2) { create :cycle }
    before do
      cycle.events << create(:event, name: 'cycle 1 event')
      cycle2.events << create(:event, name: 'cycle 2 event')
      get :index, cycle_id: cycle.id
    end

    it "returns only the events for that cycle" do
      expect(JSON.parse(response.body).count).to be(1)
    end

    it "does not return another cycle's events" do
      expect(JSON.parse(response.body)).not_to include(cycle2.to_json)
    end
  end

  describe '#show' do
    let!(:event) { create(:event, name: 'test') }
    let!(:cycle) {create :cycle}

    before do
      cycle.events << event
      get :show, id: event.id, cycle_id: cycle.id
    end

    it "returns the event" do
      expect(response.status).to be 200
      expect(event.name).to eq JSON.parse(response.body)["name"]
    end
  end
end
