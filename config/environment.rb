# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_railsforum_session',
    :secret      => '995f633c380daf0f214455e78df1d02dff637b6860b42332db6af432d60992c74b2b764281111d860432c4c942d5aec208f83a694ebc43ab966c71dc9781e81e'
  }

  config.after_initialize do
    ActionView::Base.sanitized_allowed_tags.delete 'div'
  end
end

TagList.delimiter = ' '

require 'active_record_extensions'
require 'action_controller_extensions'