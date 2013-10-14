FormApp::Application.routes.draw do
  resources :users, except: [:index] do
    resources :forms, only: [:new, :create, :index]
  end

  resources :forms, only: [:update, :destroy, :edit] do
    resources :entries, only: [:new, :create, :index]
    match '/rendered_mail' => 'forms#rendered_mail', as: :rendered_mail
    match '/code_mail' => 'forms#code_mail', as: :code_mail
    match '/both_mail' => 'forms#both_mail', as: :both_mail
    match '/targetted_mail' => 'forms#targetted_mail', as: :targetted_mail
    match '/targeted_mail_input' => 'forms#email_input', as: :email_input
  end

  resources :entries, only: [:update, :destroy, :edit]

  resource :session

  root :to => "sessions#new"

end
