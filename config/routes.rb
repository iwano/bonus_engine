BonusEngine::Engine.routes.draw do

  root to: "home#index"

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

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

    resources :events do
      resources :points, only: [:create, :update]
    end
  end

end

