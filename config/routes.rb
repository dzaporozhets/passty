Passty::Application.routes.draw do
  resources :applications do
    resources :passwords
  end

  devise_for :users

  root 'applications#index'
end
