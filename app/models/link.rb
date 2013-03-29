class Link < ActiveRecord::Base
  attr_accessible :name, :url, :remarks
  
  ################## 
  # VALIDATIONS
  ################## 
  validates_presence_of :url, :message => " cannot be blank, that wouldn't be a url!"
  validates_uniqueness_of :url, :message => " has already been added. 2.0 I'll allow duplicates and count frequency, but right now, one at a time please."
  # wack way of deciphering link structure, switch to a gem!
  validates_format_of :url, :with => URI::regexp(%w(http https)), :message  => "'s have http or https in them, silly."

  ################## 
  
  ################## 
  # SCOPES 
  ##################
  default_scope order('created_at DESC')
  ################## 

  #search method for will_pag
  def self.search(search, page)
  paginate :per_page => 10, :page => page,
           :conditions => ['url like ?', "%#{search}%"], :order => 'url'
  end

  
end
