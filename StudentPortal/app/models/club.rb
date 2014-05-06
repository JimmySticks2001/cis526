class Club < ActiveRecord::Base
validates :name,
  	length: {minimum: 3, maximum: 56},
  	allow_blank: false,
  	format: { with: /.*[a-zA-Z].*/, 
  	message: "minimum 3 characters, max 56, not all whitespace, and must include letters" }
validates :club_page_link,  
	allow_blank: true, 
	format: { with: URI::regexp(%w(http https)),
	message: "link must include http or https" }
end
