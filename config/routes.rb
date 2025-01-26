Rails.application.routes.draw do
  namespace :api do
    resources :companies do
      resources :employees, shallow: true
    end
  end
end
