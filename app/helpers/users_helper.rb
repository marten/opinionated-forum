module UsersHelper
  
  def shorten_username(str)
    # No-op if str is short enough
    return str if str.length < 12
    
    # If str is some name-like thing ("John Doe"), abbreviate to "John D."
    return str.gsub(/(\w+)(\W+)(\w).*/, '\1\2\3.') if str.match(/(\w+)(\W+)(\w).*/)
    
    truncate(str, 12)
  end
end
