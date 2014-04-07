SpaceSpotter::Application.routes.draw do
  root "welcome#index"
  get "session/new"

  resources :users
end
