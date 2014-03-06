class Event < ActiveRecord::Base
  
  validates_datetime :start, :on_or_after => lambda { Date.current }
  
  validates_datetime :end, 
  :after => :start
  
  
  validates :additionalInfo, 
  length: {minimum: 0, maximum: 500},
  allow_blank: true, 
  format: { with: /.*[a-zA-Z].*/,
  message: "must include letters" }
  
  
  validates :title,
  length: {minimum: 3, maximum: 56},
  allow_blank: false,
  format: { with: /.*[a-zA-Z].*/, 
  message: "minimum 3 characters, max 56, not all whitespace, and must include letters" }
end
