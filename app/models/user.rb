  class User < ActiveRecord::Base
  has_many :posts
  has_many :viewings, :dependent => :delete_all
  has_many :viewed_topics, :through => :viewings, :source => :topic

  before_validation :sanitize_fields
  validates_presence_of :openid_url
  validates_presence_of :name
#  validates_presence_of :email
  
  def mark_all_topics_read
    # set the time marker
    update_attribute(:all_read_upto, Time.now)
    
    # and do some housekeeping
    viewings.clear
  end
  
  private
    def sanitize_fields
      self.name  = helpers.sanitize(name)
      self.email = helpers.sanitize(email)
    end
  
end
