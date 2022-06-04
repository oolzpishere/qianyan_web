Admin::Engine.routes.draw do
  namespace :manager do
    resources :jsj_forms
    root 'conferences#index'
    
    resources :conferences
  end
end
