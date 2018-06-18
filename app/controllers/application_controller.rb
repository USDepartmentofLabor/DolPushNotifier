class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  Audited.current_user_method = :current_admin_user

  private
  def current_admin_user
    current_user.email rescue ""
  end
end
