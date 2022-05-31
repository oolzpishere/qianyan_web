Frontend::Engine.routes.draw do
  resources :certification_pdfs
  resources :pages

  root to: 'pages#index'
end
