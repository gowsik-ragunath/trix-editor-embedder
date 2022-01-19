Rails.application.routes.draw do
  devise_for :users
  root to: "thoughts#index"
  mount ActionCable.server => "/cable"

  resources :thoughts do
    collection do
      get :dynamic_extension_content
      get :extension_create
    end
  end

  resources :rooms, only: [:index, :create, :show]
  resources :direct_messages, only: [:index, :new, :create]
  resources :videos, only: [:index, :new, :create, :show]
  post "embeds", to: "embeds#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
