Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reminders
      resources :facilities
      resources :appointments
      resources :users, only: %i[create index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
