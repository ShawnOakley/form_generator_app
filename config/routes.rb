FormApp::Application.routes.draw do
  resources :users
  resource :session

  resource :test
end
