class PostSweeper < ActionController::Caching::Sweeper
  observe Post
  
  def expire_cached_content(post)
    expire_action post.topic
  end
  
  alias_method :after_save,    :expire_cached_content
  alias_method :after_destroy, :expire_cached_content
end