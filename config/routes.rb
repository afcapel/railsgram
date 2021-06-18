Rails.application.routes.draw do
  resources :posts do
    resource :picture
    resource :caption
  end

  root "posts#index"

  get "/:id", to: "profiles#show", as: "profile"
end
