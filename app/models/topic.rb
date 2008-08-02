class Topic < ActiveRecord::Base
  acts_as_taggable
  
  has_many   :posts
  has_many   :posters, :through => :posts, :source => :user
  
  has_one    :starter, :class_name => 'User', :through => :posts, :source => :user,
                       :order => '"posts".created_at ASC'
  has_one    :latestr, :class_name => "User", :through => :posts, :source => :user,
                       :order => '"posts".created_at DESC'

end
