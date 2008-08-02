# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  #protect_from_forgery # :secret => 'd252489c64a965e4db2ea656c6688140'
  layout 'application'
  before_filter :find_logged_in_user
  
  private
    def find_logged_in_user
      @current_user = User.find_or_create_by_openid_url(:openid_url => session[:user_openid_url], :name => session[:user_openid_url]) if session[:user_openid_url]
    end
end
