
StudentPortal::Application.routes.draw do

  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  get "log_in" => "sessions#new", :as => "log_in"  
  get "log_out" => "sessions#destroy", :as => "log_out"  
  get "sign_up" => "users#new", :as => "sign_up"  

  resources :clubs
  resources :faculties
  resources :researches
  resources :jobs
  resources :users  
  resources :sessions 
  resources :events do
  	collection { post :import }
  end
   root :to =>"calendar#index"

end
