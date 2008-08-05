require 'pathname'
require 'openid'
require 'openid/store/filesystem'

class SessionsController < ApplicationController

  def new
    # login page
  end
  
  def create
    if params[:skip_openid] and Rails.env.development?
      session[:user_openid_url] = params[:openid_url]
      redirect_to root_path and return
    end
    
    begin
      identifier = params[:openid_url]
      if identifier.nil? || identifier == "http://"
        flash[:error] = "OpenID URL not given"
        render(:action => 'new') and return
      end
      oidreq = consumer.begin(identifier)
    rescue OpenID::OpenIDError => e
      flash[:error] = "Discovery failed for #{identifier}: #{e}"
      redirect_to(:action => 'new') and return
    end
    return_to = create_finalize_session_url
    realm = session_url
    
    if oidreq.send_redirect?(realm, return_to, params[:immediate])
      redirect_to oidreq.redirect_url(realm, return_to, params[:immediate])
    else
      render :text => oidreq.html_markup(realm, return_to, params[:immediate], {'id' => 'openid_form'})
    end
  end

  def create_finalize
    current_url = url_for :action => :create_finalize
    parameters = params.reject{|k,v|request.path_parameters[k]}
    oidresp = consumer.complete(parameters, current_url)
    case oidresp.status
    when OpenID::Consumer::FAILURE
      if oidresp.display_identifier
        flash[:error] = ("Verification of #{oidresp.display_identifier}"\
                         " failed: #{oidresp.message}")
      else
        flash[:error] = "Verification failed: #{oidresp.message}"
      end
    when OpenID::Consumer::SUCCESS
      flash[:notice] = ("Verification of #{oidresp.display_identifier}"\
                        " succeeded.")
      session[:user_openid_url] = oidresp.display_identifier
    when OpenID::Consumer::SETUP_NEEDED
      flash[:notice] = "Immediate request failed - Setup Needed"
    when OpenID::Consumer::CANCEL
      flash[:notice] = "OpenID transaction cancelled."
    else
    end
    redirect_to root_path
  end

  
  def destroy
    session[:user_openid_url] = nil
    redirect_to root_path
  end


  def consumer
    if @consumer.nil?
      dir = Pathname.new(RAILS_ROOT).join('db').join('cstore')
      store = OpenID::Store::Filesystem.new(dir)
      @consumer = OpenID::Consumer.new(session, store)
    end
    return @consumer
  end
  
end
