class Event < ActiveRecord::Base
  	has_event_calendar
  
  	validates_datetime :start_at, :on_or_after => lambda { Date.current }
  
  	validates_datetime :end_at, 
  	:after => :start_at
  
  
  	validates :additionalInfo, 
  	length: {minimum: 0, maximum: 500},
  	allow_blank: true, 
  	format: { with: /.*[a-zA-Z].*/,
  	message: "must include letters" }
  
  
  	validates :name,
  	length: {minimum: 3, maximum: 56},
  	allow_blank: false,
  	format: { with: /.*[a-zA-Z].*/, 
  	message: "minimum 3 characters, max 56, not all whitespace, and must include letters" }
  
  
	def color
   		if self.important == true 
      		return "#7137bd" 
      	else
      		return "#83bd37"
   		end
	end
  
end
