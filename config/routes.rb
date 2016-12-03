Rails.application.routes.draw do
  get 'users/show'

  get 'static_pages/home'

  #devise_for :users
  devise_for :users
  #, :controllers => { :registrations => :registrations }

  resources :contacts
  resources :users


  # as :user do
  #   get 'users/profile', :to => 'devise/registrations#edit', :as => :user_root
  # end

  #redirect_to 'user/show' , :id => session[:user_id]
  #redirect_to user_url(:session[:user_id])

  root 'static_pages#home'

  namespace :api do
  #namespace :api, path: '', constraints: {subdomain: 'api'} do
  #namespace :api, path: '', constraints: {subdomain: 'api'}, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
    end
  end

end