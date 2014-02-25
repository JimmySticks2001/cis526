class Event < ActiveRecord::Base
  validates :additionalInfo, length: {minimum: 0, maximum: 160}, allow_blank: true, 
  format: { with: /.*[a-zA-Z].*/, message: "must include letters" }
end
