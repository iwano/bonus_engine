BonusEngine::Engine.routes.draw do
  resources :cycles do
    resources :events
  end
end
