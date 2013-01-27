class Link < ActiveRecord::Base
  attr_accessible :name, :url
  
  # Validations
  validates_presence_of :url, :message => "cannot be blank"
  #validates_uniqueness_of :url, :message => "Rich has this links, yo."
 
end
