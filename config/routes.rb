Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :documents, except: [:new, :edit]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
