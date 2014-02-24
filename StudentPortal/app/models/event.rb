class Event < ActiveRecord::Base
  attr_accessible :additionalInfo, :end, :sponsor, :start, :title
  validates :additionalInfo, length: {minimum: 0, maximum: 160}, allow_blank: true, 
	inclusion:{ in: %w(/\A[a-zA-Z]+\z/)}
  #validation for addiitonal info not working  

end
