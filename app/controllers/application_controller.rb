class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :get_user_status
  
  def get_user_status
    if signed_in?
      unless current_user.active
        sign_out(current_user)
        redirect_to root_path, :alert => t("errors.messages.account_inactive")
      end
    end
  end
  
end
