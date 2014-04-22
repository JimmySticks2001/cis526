class Job < ActiveRecord::Base
	attr_accessible :kind, :title, :desc, :poster, :host
	
	searchable do
		text :title, :boost => 5
		text :kind, :boost => 3
		text :host, boost =>3
		text :desc
	end

end
