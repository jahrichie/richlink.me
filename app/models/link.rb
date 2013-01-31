class Link < ActiveRecord::Base
  attr_accessible :name, :url
  #require  'pismo'
  
  ################## 
  # VALIDATIONS
  ################## 
  validates_presence_of :url, :message => " cannot be blank, that wouldn't be a url!"
  validates_uniqueness_of :url, :message => " has already been added"
  validates_format_of :url, :with => URI::regexp(%w(http https))

  ################## 
  
  ################## 
  # SCOPES 
  ##################
  default_scope order('created_at DESC')
  ################## 

  #search method for will_pag
  def self.search(search, page)
  paginate :per_page => 20, :page => page,
           :conditions => ['url like ?', "%#{search}%"], :order => 'url'
  end

  
end
