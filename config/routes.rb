Rails.application.routes.draw do

  namespace :api do
    resources :jobs, except: [:new, :edit]
  end

end
