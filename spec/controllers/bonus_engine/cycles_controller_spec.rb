require 'spec_helper'

module BonusEngine
  describe CyclesController do
    describe "#index" do
      let!(:cycle) { create(:cycle, name: 'test') }
      let(:expected_response) { [cycle].to_json }
      before { get :index, {format: :json} }

      it "returns a collection of cycles" do
        expect(response.status).to be 200
        expect(response.body).to eq expected_response
      end
    end
  end
end

