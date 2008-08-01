ActionController::Routing::Routes.draw do |map|

  map.resources :topics, :member => { :tag => :post, :untag => :post } do |topic|
    topic.resources :posts
  end

  map.resource  :session,  :member => { :create_finalize => :get }
  map.login     '/login',  :controller => 'sessions', :action => 'new'
  map.logout    '/logout', :controller => 'sessions', :action => 'destroy'
  map.resources :users
  map.root      :controller => 'topics'

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
