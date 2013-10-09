FormApp::Application.routes.draw do
  resources :users do
    resources :forms, only: [:new, :create, :index]
  end

  resources :forms, only: [:update, :destroy, :edit] do
    resources :entries, only: [:new, :create, :index]
  end

  resources :entries, only: [:update, :destroy, :edit]

  resource :session

end
