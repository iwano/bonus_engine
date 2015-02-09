require 'rails_helper'

describe BonusEngine::Api::PointsController do
  render_views
  let!(:cycle) { create :cycle }
  let!(:event) { create(:event, name: 'test') }
  let!(:giver) { create(:user, name: 'Givencio') }
  let!(:receiver) { create(:user, name: 'Recibencio') }
  let(:create_params){
    {
      event_id: event.id,
      receiver_id: receiver.id,
      quantity: 500,
      message: 'lorem ipsum dolo'
    }
  }

  before do
    cycle.events << event
    set_current_user giver
  end

  describe '#create' do
    context 'with good arguments' do
      before do
        post :create, create_params
      end

      it 'creates points for a user' do
        expect(response.status).to be 200
        expect(BonusEngine::Point.count).to be > 0
      end
    end

    context 'with bad argunents' do
      before do
        create_params[:quantity] = 0
        post :create, create_params
      end

      it 'should not create poins for user' do
        expect(response.status).to be 422
        expect(BonusEngine::Point.count).to be 0
      end
    end
  end

  describe '#update' do
    context 'with good arguments' do
      let!(:existing_point){ create :point }
      before do
        put :update, event_id: 1, id: existing_point.id, message: 'kidding'
        existing_point.reload
      end

      it 'updates attributes' do
        expect(existing_point.message).to be_eql 'kidding'
        expect(response.status).to be 200
      end
    end

    context 'with bad arguments' do
      let!(:existing_point){ create :point }
      before do
        put :update, event_id: 1, id: existing_point.id, quantity: 0
        existing_point.reload
      end

      it 'updates attributes' do
        expect(response.status).to be 422
      end
    end
  end
end
