class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  #before_filter :before_things

  protect_from_forgery  
  helper_method :current_user
  helper_method :unauthorized
  helper_method :mobile_device?

  def user_logged_in!
    return if current_user.present?
    flash[:alert] = "Please sign in to view that resource!"
    redirect_to login_url
  end

  def unauthorized(path)
    flash[:alert] = "You are not authorized to view that resource!"
    redirect_to  path
  end

  
  private  
  #current user keeps track of the user logged in so we can display (log in or log out as..) links on the layout view
  def current_user  
    @current_user ||= User.find(session[:user_id]) if
      session[:user_id]  
  end  


  def mobile_device?
    request.user_agent =~ /android|blackberry|iphone|ipad|ipod|iemobile|mobile|webos/i
  end

end  