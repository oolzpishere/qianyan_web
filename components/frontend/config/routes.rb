Frontend::Engine.routes.draw do
  root to: 'pages#index'

  get 'corp', to: 'pages#corp'
  get 'pingbi', to: 'pages#pingbi'
  get 'conferences', to: 'pages#conferences'
  resources :pages

  get 'certifications/search', to: 'certifications#search'
  post 'certifications/search_datum', to: 'certifications#search_datum'
  get 'certifications/results', to: 'certifications#results'
  get 'certifications/download/:id', to: 'certifications#download'
  resources :certifications

end
