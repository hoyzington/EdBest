Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'apply', to: 'experts#new'
  post 'apply', to: 'experts#create'
  resources :experts, except: [:new, :create] do
    resources :courses, except: [:show]
  end

  resources :courses, only: [:show] do
    resources :experts, only: [:index]
    resources :newbies, only: [:index]
  end

  get 'signup', to: 'newbies#new'
  post 'signup', to: 'newbies#create'
  resources :newbies, except: [:new, :create, :index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
