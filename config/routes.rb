Rails.application.routes.draw do
  namespace :api do
    resources :posts, except: [:new, :edit] do
      resources :comments, only: [:index, :create, :update, :destroy]
    end
  end
end
