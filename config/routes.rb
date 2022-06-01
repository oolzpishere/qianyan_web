Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount Account::Engine   => '/', as: 'account'
  mount Admin::Engine   => '/', as: 'admin'
  mount Frontend::Engine   => '/', as: 'frontend'
  mount Backend::Engine   => '/', as: 'backend'
  mount Jsj::Engine   => '/', as: 'jsj' 

  get '/manager/conferences', to: 'admin/manager/conferences#index', :as => :admin_root
  
end
