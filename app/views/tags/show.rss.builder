xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Forum")
    xml.link(root_url)
    xml.description("Forum")
    xml.language('en-us')
      for topic in @topics
        xml.item do
          xml.title(topic.title)
          xml.description("")
          xml.author(topic.starter.name)
          xml.pubDate(topic.created_at.strftime("%a, %d %b %Y %H:%M:%S %z"))
          xml.link(topic_url(topic))
          xml.guid(topic_url(topic))
        end
      end
  }
}
