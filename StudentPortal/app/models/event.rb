class Event < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/  

	searchable do
		text :additionalInfo, :boost => 3
		text :name, :boost => 5
		text :sponsor, :date_start, :date_end		
	end
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
	
	def date_start
		start_at.strftime("%B %Y")
	end
	
	def date_end
		end_at.strftime("%B %Y")
	end
	
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			event = find_by_id(row["id"]) || new
			parameters = ActionController::Parameters.new(row.to_hash)
			event.update(parameters.permit(:name, :start_at, :end_at, :sponsor, :additionalInfo, :food, :swag, :comp, :important))
			event.save!
		end
	end
		
end
