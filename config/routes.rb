Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  constraints format: :json do
    resource :sessions, only: [:create]
    resource :players, only: [:create]
  end
end
