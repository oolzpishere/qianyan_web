Admin::Engine.routes.draw do
  namespace :manager do
    root 'conferences#index'
    
    resources :conferences
  end
end
