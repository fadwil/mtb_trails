Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/trail_systems", to: "trail_systems#index"
  get "/trail_systems/:id", to: "trail_systems#show"
end
