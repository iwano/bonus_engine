require 'rails_helper'

module BonusEngine
  describe EventsController do
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

    describe "#create" do
      context "with valid data" do

        let(:cycle) { create(:cycle) }
        let(:params) do
          {
            cycle_id: cycle.id,
            event: {
              name: 'event',
              opens_at: "2015-01-13 00:00:00 UTC",
              closes_at: "2015-01-15 00:00:00 UTC"
            }
          }
        end

        before do
          post :create, params
        end

        it 'creates a new event' do
          expect(response.status).to be 201
          expect(JSON.parse(response.body)['name']).to eq params[:event][:name]
        end
      end

      context 'with invalid data' do

        let(:cycle) { create(:cycle) }
        let(:params) do
          {
              cycle_id: cycle.id,
              event: {
                  name: '',
                  opens_at: '',
                  closes_at: ''
              }
          }
        end

        before do
          post :create, params
        end

        it 'does not create the event' do
          expect(response.status).to be 422
        end
      end
    end

    describe '#update' do
      context 'with valid data' do
        let!(:event) { create :event }
        let!(:cycle) { create(:cycle, events: [event]) }
        let(:params) do
          {
              cycle_id: cycle.id,
              id: event.id,
              event: {
                  name: 'updated name',
                  opens_at: '2015-01-13',
                  closes_at: '2015-01-13'
              }
          }
        end

        before do
          put :update, params
        end

        it 'updates the event' do
          expect(response.status).to be 200
          expect("updated name").to eq JSON.parse(response.body)["name"]
        end
      end

      context 'with invalid data' do
        let!(:event) { create :event }
        let!(:cycle) { create(:cycle, events: [event]) }
        let(:params) do
          {
              cycle_id: cycle.id,
              id: event.id,
              event: {
                  name: '',
                  opens_at: '',
                  closes_at: ''
              }
          }
        end

        before do
          put :update, params
        end

        it 'does not update the event' do
          expect(response.status).to be 422
        end
      end
    end
  end
end
