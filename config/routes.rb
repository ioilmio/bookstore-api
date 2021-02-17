Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/users/sessions', omniauth_callbacks: 'api/v1/users/omniauth_callbacks' }
      resources :users do
        resources :books
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
