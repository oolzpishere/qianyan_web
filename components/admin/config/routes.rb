Admin::Engine.routes.draw do
  namespace :manager do

    get 'attend_data/select' => 'attend_data#select'
    resources :attend_data
    resources :jsj_forms
    root 'conferences#index'
    
    resources :conferences
  end
end
