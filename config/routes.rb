Rails.application.routes.draw do
  root "pages#home"
  get "pages/about", as: :about
  get "pages/project", as: :project
  get "pages/setup", as: :setup
  get "pages/contact", as: :contact
  resources :blog, only: [:index, :show]

  namespace :admin do
    resources :blog
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
