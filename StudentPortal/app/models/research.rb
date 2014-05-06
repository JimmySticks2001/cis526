class Research < ActiveRecord::Base
	
	validates :title, 
  	length: {minimum: 3, maximum: 140},
  	allow_blank: false, 
  	format: { with: /.*[a-zA-Z].*/,
  	message: "Title must be between 3 and 140 characters and must include letters." }
	
	validates :content, 
  	length: {minimum: 3, maximum: 1500},
  	allow_blank: false, 
  	format: { with: /.*[a-zA-Z].*/,
  	message: "Content must be between 3 and 1500 characters and must include letters." }
	
end