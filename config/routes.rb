Rails.application.routes.draw do
  require "sidekiq/web"

  resources :ebooks do
    collection do
      get "import"
      post "import_csv"
    end
  end

  namespace :api do
    namespace :v1 do
      resources :ebooks
    end
  end

  root "home#index"

  mount Sidekiq::Web => "/sidekiq"
end
