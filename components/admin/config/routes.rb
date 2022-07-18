Admin::Engine.routes.draw do
  namespace :manager do
    resources :external_articles
    resources :articles

    get 'attend_data/select' => 'attend_data#select'
    post "attend_data/update_datum/:id" => "attend_data#update_datum"
    resources :attend_data
    resources :jsj_forms
    root 'conferences#index'
    
    resources :conferences
  end
end
