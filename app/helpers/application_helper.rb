module ApplicationHelper
  def flash_class(level)
    Rails.logger.debug("***** #{level} #{level.class}")
    case level
        when "notice" then "alert alert-info"
        when "success" then "alert alert-success"
        when "error" then "alert alert-error"
        when "alert" then "alert alert-error"
    end
  end
end
