Iforum::Application.routes.draw do |map|
  
  match 'login' => "users#login", :as => "login"
  match 'logout' => "users#logout", :as => "logout"
  match 'signup' => "users#new", :as => "signup"
  
  match 'feed'  => redirect("/feed.xml")
  
  match 'feed.:format' => "posts#feed", :as => "feed"
    
  resources :users

  resources :forums do
    resources :posts
  end
  
  resources :posts do
    resources :comments
  end
  
  resources :comments
  
  root :to => "forums#index"
  match ':controller(/:action(/:id(.:format)))'
  
  match '*anything', :to => redirect("/")
end
