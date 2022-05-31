Admin::Engine.routes.draw do
  namespace :manager do
    resources :conferences
  end
end
