Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'apply', to: 'experts#new'
  #post 'apply', to: 'experts#create'
  resources :experts do
    resources :offered_courses, except: [:show]
  end

  resources :offered_courses, only: [:show, :index] do
    resources :experts, only: [:index, :show]
  end

  get 'signup', to: 'newbies#new'
  #post 'signup', to: 'newbies#create'
  resources :newbies, except: [:new, :index]
  
end
