Rails.application.routes.draw do
  devise_for :users

  resources :events, only: [:index, :create, :show, :edit, :update, :destroy]

  root "events#index"

  post "events/:event_id/attend", to: "event_attendances#create", as: :attend_event
  delete "events/:event_id/attend", to: "event_attendances#destroy", as: :leave_event
  post "events/:event_id/invite", to: "event_invitations#create", as: :invite_user

  get "users/:id", to: "users#show", as: :user

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest"
  # get "service-worker" => "rails/pwa#service_worker"
end