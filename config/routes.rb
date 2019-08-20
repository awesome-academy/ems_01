Rails.application.routes.draw do
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :users, except: [:show, :edit, :update]
    resources :subjects, except: :show
    resources :questions
    resources :exams, only: [:index, :create, :new]
  end

  resources :users, only: [:show, :edit, :update]
end
