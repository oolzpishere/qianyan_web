Frontend::Engine.routes.draw do
  root to: 'pages#index'

  resources :pages

  get 'certifications/search', to: 'certifications#search'
  post 'certifications/search_datum', to: 'certifications#search_datum'
  resources :certifications

end
