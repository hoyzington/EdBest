Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'apply', to: 'experts#new'
  #post 'apply', to: 'experts#create'
  resources :experts do
    resources :offered_courses
  end

  resources :offered_courses, only: [:index, :show, :create, :update] do
    resource :expert, only: [:show]
  end

  get 'signup', to: 'newbies#new'
  #post 'signup', to: 'newbies#create'
  resources :newbies, except: [:index]

end
