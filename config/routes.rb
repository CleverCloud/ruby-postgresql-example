Rails.application.routes.draw do
  get "welcome/index"

  resources :articles do
    resources :comments, only: [:create, :destroy]
  end

  root "welcome#index"
end
