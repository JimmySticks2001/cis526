class Faculty < ActiveRecord::Base
has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
validates :name,
  	length: {minimum: 3, maximum: 56},
  	allow_blank: false,
  	format: { with: /.*[a-zA-Z].*/, 
  	message: "minimum 3 characters, max 56, not all whitespace, and must include letters" }
validates :personal_page_link,  
	allow_blank: true, 
	format: { with: URI::regexp(%w(http https)),
	message: "link must include http or https" }
validates :email,
	allow_blank: true,
	format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, 
	message: "email format invalid" }
end
