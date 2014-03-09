class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery  
  helper_method :current_user  
  
  #current user keeps track of the user logged in so we can display (log in or log out as..) links on the layout view
  private  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if
      session[:user_id]  
  end  
end  