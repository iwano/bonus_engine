BonusEngine::Engine.routes.draw do
  namespace :api do
    namespace :admin do
      resources :cycles do
        resources :events
      end

      resources :users, only: [:index, :show]
    end

    resources :cycles, only: [:index, :show] do
      resources :events, only: [:index, :show]
    end
  end
end

