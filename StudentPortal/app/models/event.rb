class Event < ActiveRecord::Base
  attr_accessible :additionalInfo, :end, :sponsor, :start, :title
end
