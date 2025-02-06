Rails.application.routes.draw do
  resources :ebooks

  namespace :api do
    namespace :v1 do
      resources :ebooks
    end
  end

  root "home#index"
end
