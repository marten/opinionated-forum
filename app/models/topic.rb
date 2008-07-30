class Topic < ActiveRecord::Base
  acts_as_taggable
  
  has_many :posts
end
