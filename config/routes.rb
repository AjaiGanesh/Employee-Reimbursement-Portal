Rails.application.routes.draw do
  root "employees#index"
  resources :employees, except: [:index]
  resources :bills
  resources :departments
end
