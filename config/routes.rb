Rails.application.routes.draw do

  root "pages#home"
  get "pages/home"
  get "pages/about"
  get "pages/help"
  namespace :admin do
    root "admin#index"
    resources :films
  end
end
