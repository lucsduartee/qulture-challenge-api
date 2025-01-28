Rails.application.routes.draw do
  namespace :api do
    resources :companies do
      resources :employees, shallow: true do
        member do
          post :promote
          get :peers
          get :subordinates
          get :deep_subordinates
        end
      end
    end
  end
end
