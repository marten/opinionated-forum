class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_many :replies
  belongs_to :parent
  
  validates_presence_of :body
  
end
