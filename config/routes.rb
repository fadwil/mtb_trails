Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/trail_systems", to: "trail_systems#index"
  get "/trail_systems/new", to: "trail_systems#new"
  post "/trail_systems", to: "trail_systems#create"
  get "/trail_systems/:id", to: "trail_systems#show"
  get "/trail_systems/:id/edit", to: "trail_systems#edit"
  patch "/trail_systems/:id", to: "trail_systems#update"
  get "/trails", to: "trails#index"
  get "/trails/:id", to: "trails#show"
  get "/trail_systems/:id/trails/new", to: "trail_systems/trails#new"
  get "/trail_systems/:id/trails", to: "trail_systems/trails#index"
  post "/trail_systems/:id/trails", to: "trail_systems/trails#create"

end
