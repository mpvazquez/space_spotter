SpaceSpotter::Application.routes.draw do
  #splash page
  root "welcome#index"

  #user session info
  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  #user resources
  resources :users
end
