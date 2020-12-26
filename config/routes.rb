Rails.application.routes.draw do
  devise_for :users
  root to: "thoughts#index"
  mount ActionCable.server => "/cable"

  resources :thoughts

  resources :rooms, only: [:index, :create, :show]
  resources :direct_messages, only: [:index, :new, :create]
  post "embeds", to: "embeds#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
