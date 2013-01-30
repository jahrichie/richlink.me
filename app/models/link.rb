class Link < ActiveRecord::Base
  attr_accessible :name, :url
  #require  'pismo'
  
  ################## 
  # VALIDATIONS
  ################## 
  validates_presence_of :url, :message => " cannot be blank, that wouldn't be a url!"
  validates_uniqueness_of :url, :message => " has already been added"
  ################## 
  
  ################## 
  # SCOPES 
  ##################
  default_scope order('created_at DESC')
  ################## 

  def self.search(search, page)
  paginate :per_page => 8, :page => page,
           :conditions => ['url like ?', "%#{search}%"], :order => 'url'
  end

  
end
