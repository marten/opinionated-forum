module TopicsHelper
  def class_style_for_seen_topic(topic, user)
    return "read" unless user
    # A topic can be read because the user has "marked all topics read"
    return "read" if user.all_read_upto && user.all_read_upto > topic.posts.last.created_at
    # Or because he read the topic
    return "read" if viewing = topic.last_read_by(user) and viewing.seen >= topic.posts.last.created_at
    return "unread"
  end
  
  def posters(posts)
    h = Hash.new
    posts.each { |post| h[post.user] = post.created_at }
    posters = h.map.sort {|a,b| a[1] <=> b[1] }
    posters.map {|user, time| time.to_formatted_s(:short) + " " + link_to(user.name, user) }.join(",<br/>")
  end
  
end
