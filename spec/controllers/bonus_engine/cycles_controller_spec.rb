require 'rails_helper'


module BonusEngine
  describe CyclesController do
    render_views
    describe "#index" do
      let!(:cycle) { create(:cycle, name: 'test') }
      let(:expected_response) { [{"name" => 'test'}] }

      before do
        get :index, {format: :json}
      end


      it "returns a collection of cycles" do
        expect(response.status).to be 200
        expect(expected_response).to eq JSON.parse(response.body)
      end
    end

    describe '#show' do
      let!(:cycle) { create(:cycle, name: 'test') }

      before do
        get :show, {id: cycle.id, format: :json}
      end

      it "returns the cycle" do
        expect(response.status).to be 200
        expect(cycle.name).to eq JSON.parse(response.body)["name"]
      end
    end

    describe '#create' do
      context 'with valid data' do
        let(:params) do
          {
              cycle: {
                  name: 'test'
              }
          }
        end

        before do
          get :create, params
        end

        it 'creates a new cycle' do
          expect(response.status).to be 201
          expect(params[:cycle][:name]).to eq JSON.parse(response.body)["name"]
        end
      end

      context 'with invalid data' do
        let(:params) do
          {
              cycle: {
                  name: ''
              }
          }
        end

        before do
          get :create, params
        end

        it 'does not create the cycle' do
          expect(response.status).to be 422
        end
      end
    end

    describe '#update' do
      context 'with valid data' do
        let(:cycle) { create :cycle }

        before do
          put :update, id: cycle.id, cycle: { name: 'new name' }
        end

        it 'updates the cycle' do
          expect(response.status).to be 200
          expect("new name").to eq JSON.parse(response.body)["name"]
        end
      end

      context 'with invalid data' do
        let(:cycle) { create :cycle }

        before do
          put :update, id: cycle.id, cycle: { name: '' }
        end

        it 'updates the cycle' do
          expect(response.status).to be 422
        end
      end
    end
  end
end
