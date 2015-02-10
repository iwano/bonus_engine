require 'rails_helper'

describe BonusEngine::HomeController do
  describe '#index' do
    subject { get :index }

    it 'renders the application' do
      expect(subject.status).to be 200
      expect(subject).to render_template(:index)
    end
  end
end
