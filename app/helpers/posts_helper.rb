module PostsHelper
  def topic_post_path(topic, post)
    topic_path(topic, :anchor => post.id)
  end
end
