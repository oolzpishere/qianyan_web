Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Frontend::Engine   => '/', as: 'frontend'
  mount Backend::Engine   => '/', as: 'backend'
  
  
end
