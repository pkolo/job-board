Rails.application.routes.draw do

  root :to => 'api/jobs#index'

  namespace :api do
    resources :jobs, except: [:new, :edit]
    get '/categories', to: 'categories#index'
  end

end
