Rails.application.routes.draw do
  get 'pages/index'

  
  get "/realcraft200" => 'pages#realcraft_200'
  get 'about', to: 'pages#about', as: :about
  #get "prices", to: "pages#prices", as: :prices
  get "dealers", to: "pages#dealers", as: :dealers
  get 'realcraft190', to: 'pages#realcraft_190', as: :realcraft_190
  get 'realcraft200', to: 'pages#realcraft_200', as: :realcraft_200
  get 'realcraft440', to: 'pages#realcraft_440', as: :realcraft_440
  get 'realcraft470', to: 'pages#realcraft_470', as: :realcraft_470
  get "wait", to: 'pages#please_wait', as: :wait
  post "send_boat_request", to: 'pages#send_boat_request', as: :send_boat_request
  post "send_dealer_request", to: 'pages#send_dealer_request', as: :send_dealer_request
  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
