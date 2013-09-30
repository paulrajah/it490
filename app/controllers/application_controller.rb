class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  helper_method :is_admin?
  def is_admin?
    current_user.try(:is_admin)
  end

  def is_admin_filter
    unless is_admin?
      flash[:error] = "Admin privileges required to do this."
      redirect_to new_user_session_path
    end
  end

end
