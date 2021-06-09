Rails.application.routes.draw do
  resources :posts do
    resource :picture
    resource :caption
  end

  root "posts#index"
end
