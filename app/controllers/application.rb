# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # :secret => 'd252489c64a965e4db2ea656c6688140'
  layout 'application'
  before_filter :find_logged_in_user
  
  private
    def find_logged_in_user
      if session[:user_openid_url]
        @current_user = User.find_or_initialize_by_openid_url(:openid_url => session[:user_openid_url], :name => session[:user_openid_url])
        
        if @current_user.new_record?
          if @current_user.save
            session[:return_path] = request.url
            redirect_to @current_user and return
          else
            raise "#{@current_user.errors.full_messages}"
          end
        end
      end
      
      return true
    end
    
    def require_login
      @current_user
    end
    
    # Cache different pages for Admin and Users
    def action_fragment_key(options)
      url_for(options).split('://').last
    end
    
end
