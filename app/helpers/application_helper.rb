module ApplicationHelper
  include TagsHelper
  
  def current?(dst)
    dst = '/' + dst unless dst.index('/') == 0
    request.request_uri.index(dst) == 0 ? 'current' : nil
  end
  
  def safe_markdown(text)
    markdown(sanitize(text))
  end
  
end
