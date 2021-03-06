Rails.application.routes.draw do
  root to: 'main#index'
  resources :cards_tests
  resources :tests do
    member do
      get 'create_on_incorrect'
    end
    collection do
      get 'combine_new'
      post 'combine_create'
    end
  end
  resources :cards_tags
  resources :cards
  resources :tags
  resources :categories
  resources :domains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
