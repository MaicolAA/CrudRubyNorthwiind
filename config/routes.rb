Rails.application.routes.draw do
   # config/routes.rb

  # Otras rutas...

  # Ruta para el controlador Employees y su acción index
  get '/employees', to: 'employees#index'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"


  resources :employees

  


end
