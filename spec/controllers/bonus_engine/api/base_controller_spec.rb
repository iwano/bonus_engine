require "rails_helper"

class  BonusEngine::Api::DummyController < BonusEngine::Api::BaseController
  # Dummy controller for testing purposes
end

describe BonusEngine::Api::DummyController do
  # Reopen controller for testing purposes
  controller do
    def index
      render nothing: true
    end
  end

  context "when user is not logged in" do

    before do
      set_current_user(nil)
    end

    it "restricts access" do
      expect{
        get :index
      }. to raise_error(BonusEngine::Api::DummyController::AccessDenied)
    end
  end

  context "when user is logged in" do
    let(:user) { create :user }

    before do
      set_current_user(user)
    end

    it "restricts access" do
      get :index
      expect(response.status).to be 200
    end
  end
end
