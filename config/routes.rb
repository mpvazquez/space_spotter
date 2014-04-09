SpaceSpotter::Application.routes.draw do
  #splash page
  root "welcome#index"

  #user session info
  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  #user resources
  resources :users do
    resources :spot_mails
  end

  resources :listings do
    resources :timeslots
  end

  resources :vendors do
    resources :listings, controller: "vendors/listings" do
      resources :timeslots
    end
  end

  resources :customers do
    resources :bookings
  end
end
