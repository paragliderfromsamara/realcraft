Rails.application.routes.draw do
  get 'pages/index'

  
  get "/realcraft200" => 'pages#realcraft_200'
  get 'about', to: 'pages#about', as: :about
  get 'contacts', to: 'pages#contacts', as: :contacts
  get 'realcraft190', to: 'pages#realcraft_190', as: :realcraft_190
  get 'realcraft200', to: 'pages#realcraft_200', as: :realcraft_200
  get "wait", to: 'pages#please_wait', as: :wait
  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
