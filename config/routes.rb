Rails.application.routes.draw do
  root to: "top#index"

  devise_for :users

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
