Rails.application.routes.draw do
  require "sidekiq/web"

  devise_for :users

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

  get "/scraping/search", to: "scraping#search", as: "search_scraping"
  post "/scraping/pull_book_info", to: "scraping#pull_book_info", as: "pull_book_info_scraping"

  root "home#index"

  mount Sidekiq::Web => "/sidekiq"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
