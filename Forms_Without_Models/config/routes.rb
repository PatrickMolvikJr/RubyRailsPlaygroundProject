Rails.application.routes.draw do

  resources :blogs do
    resources :comments
  end

  resources :product_reviews
  devise_for :users
  resources :articles
  resources :reviews
  resources :products do
    get 'page/:page', action: :index, on: :collection
    resources :articles
    resources :product_reviews
  end
  resources :restaurants

  get 'puzzles/new'
  post 'puzzles/new', to: 'puzzles#create'
  get 'puzzles/show'

  get 'store', to: 'stores#index', as: 'store_index'

  get 'store/:id', to: 'stores#show', as: 'store_show'

  get 'page/contact_us'

  get 'page/products'

  get 'page/preferences'

  get 'page/blog'

  get 'page/calendar((/:month)/:year)',
      to: 'page#calendar',
      as: 'calendar'

  get 'page/articles'

  get 'page/login'

  get 'page/home'

  root 'stores#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
