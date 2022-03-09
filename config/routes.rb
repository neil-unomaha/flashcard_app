Rails.application.routes.draw do
  resources :fillin_card_tests
  resources :fillin_tests
  resources :fillin_categories
  resources :fillin_domains
  resources :fillin_cards
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
  resources :cards
  resources :categories
  resources :domains
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
