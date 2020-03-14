Rails.application.routes.draw do
  root to: "thoughts#index"
  
  resources :thoughts
  post "embeds", to: "embeds#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
