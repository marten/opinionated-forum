ActionController::Routing::Routes.draw do |map|
  map.resources :posts

  map.resources :topics

  map.resource  :session,  :member => { :create_finalize => :get }
  map.login     '/login',  :controller => 'session', :action => 'new'
  map.logout    '/logout', :controller => 'session', :action => 'destroy'
  map.resources :users
  map.root      :controller => 'topics'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
