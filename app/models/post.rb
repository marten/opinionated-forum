class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_many :replies
  belongs_to :parent
  
  before_validation :sanitize_fields
  validates_presence_of :body

  private
    def sanitize_fields
      self.body = helpers.sanitize(body)
    end

end
