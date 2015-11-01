Rails.application.routes.draw do
  resource  :session
  resources :examples

  resources :messages do
    resources :comments
  end
  resources :documents

  root 'examples#index'
end
