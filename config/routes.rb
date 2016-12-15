Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  default_url_options :host => "gmail.com"

  root 'welcome#index'
  get 'signup' => 'users#new'
  resources :users do
    resources :stills do
      resources :comments

      member do
        get 'email'
      end
    end

    resources :animations do
      resources :slides
      resources :comments
    end

    member do
      get 'confirm_email'
      get 'until_confirm'
      get 'resend_email'
    end
  end

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
