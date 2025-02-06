Rails.application.routes.draw do
  resources :ebooks
  root "home#index"
end
