class Topic < ActiveRecord::Base
  acts_as_taggable
  
  has_many   :posts
  has_many   :posters, :through => :posts, :source => :user
  
  has_one    :starter, :class_name => 'User', :through => :posts, :source => :user,
                       :order => '"posts".created_at ASC'
  has_one    :latestr, :class_name => "User", :through => :posts, :source => :user,
                       :order => '"posts".created_at DESC'

  has_many   :viewings
  has_many   :viewers, :through => :views, :source => :user

  validates_presence_of :title
  
  def last_read_by(user)
    viewings.find_by_user_id(user.id)
  end
  
  def read_by(user)
    v = viewings.find_or_initialize_by_user_id(user.id)
    v.seen = Time.now
    v.save
  end

end
