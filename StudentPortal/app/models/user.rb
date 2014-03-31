class User < ActiveRecord::Base  
  has_many :assignments
  has_many :roles, :through => :assignments


  #add more validation in User model for validations for password length and email format  

  attr_accessor :password  

  before_save :encrypt_password  
    
  validates_confirmation_of :password  
  validates_presence_of :password, :on => :create  
  validates_presence_of :userName  
  validates_uniqueness_of :userName  
    
  def encrypt_password  
    if password.present?  
      self.passwordSalt = BCrypt::Engine.generate_salt  
      self.passwordHash = BCrypt::Engine.hash_secret(password, passwordSalt)  
    end  
  end  

def self.authenticate(userName, password)
    user = find_by_userName(userName)
    if user && user.passwordHash == BCrypt::Engine.hash_secret(password, user.passwordSalt)
      user
    else
      nil
    end
  end  


end  