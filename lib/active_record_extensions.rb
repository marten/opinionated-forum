class ActiveRecord::Base
  def helpers
    Helper.instance
  end

  class Helper
    include Singleton
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::SanitizeHelper
  end
end