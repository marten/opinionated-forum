ActionController::Routing::Routes.draw do |map|

  map.resources :tags
  
  map.resources :topics, :collection => {:mark_all_read => :post},
                         :member => { :tag => :post, 
                                      :untag => :post,
                                      :update_title_of => :post } do |topic|
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
