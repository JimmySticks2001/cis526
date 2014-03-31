class UsersController < ApplicationController  
  def new  
    @user = User.new  
  end  
    
  def create  
  @user = User.new(user_params) 
  if @user.save  
    if @user.admin?
	r = Role.find(:first, :conditions => [ "name = ?", 'Admin'])	
	r.users << @user
	#@user.roles << r 
   end
    if @user.student?
	r = Role.find(:first, :conditions => [ "name = ?", 'Student'])	
	r.users << @user
	#@user.roles << r 
   end 
    if @user.faculty?
	r = Role.find(:first, :conditions => [ "name = ?", 'Faculty'])	
	r.users << @user
	#@user.roles << r 
   end
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end  



 private

  def user_params
    params.require(:user).permit(:userName, :password, :bitmask, :passwordHash, :passwordSalt, :clubInfo, :admin, :student, :faculty)
  end

end  
