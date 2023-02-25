Rails.application.routes.draw do
  root 'splash_screen#splash'
  get '/splash', to: 'splash_screen#splash'
  
  devise_for :users
  
  devise_scope :user do
    # root to: 'devise/sessions#new'
  end
  resources :users
  resources :groups, :path => "categories" do 
    resources :expenses, :path => "transactions"
  end
  
end