BonusEngine::Engine.routes.draw do
  resources :cycles do
    resources :events
  end

  resources :users, only: [:index, :show]
end
