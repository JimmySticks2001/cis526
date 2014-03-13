class SessionsController < ApplicationController  
 def authenticate(userName, password)
  u = first(:conditions => {:userName => userName, :state => 'active'})
  u && u.authenticated?(password) ? [true, u] : [false, u]
 end

  def new  
  end  
     def index  
  end

  def create  
    user = User.authenticate(params['userName'], params['password'])  
    if user  
      session[:user_id] = user.id  
      redirect_to root_url 
    else  
      flash.now.alert = "Invalid userName or password"  
      render "new"  
    end  
  end 
 
def destroy  
  session[:user_id] = nil  
  redirect_to root_url, :notice => "Logged out!"  
end  

 private

  def password_params
    params.require(:password)

  end
   def userName_params
    params.require(:userName)
  end
end  