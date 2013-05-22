Passty::Application.routes.draw do
  resources :applications do
    resources :passwords
  end

  resource :password_check

  devise_for :users

  root 'applications#index'
end
