Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'signup' => 'users#new'
  resources :users do
    resources :stills do
      resources :slides
    end
    
    resources :animations do
      resources :animation_slide
    end

    member do
      get :confirm_email
    end
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
