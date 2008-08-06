class Topic < ActiveRecord::Base
  acts_as_taggable
  
  has_many   :posts, :include => :user, :dependent => :destroy
  has_many   :posters, :through => :posts, :source => :user
  
  has_many   :viewings
  has_many   :viewers, :through => :views, :source => :user

  before_validation :sanitize_fields
  validates_presence_of :title
  
  def last_read_by(user)
    viewings.find_by_user_id(user.id)
  end
  
  def read_by(user)
    v = viewings.find_or_initialize_by_user_id(user.id)
    v.seen = Time.now
    v.save
  end
  
  private
    def sanitize_fields
      self.title = helpers.sanitize(title)
    end


end
