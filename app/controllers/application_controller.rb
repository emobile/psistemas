class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper  
  protect_from_forgery with: :exception
  before_filter :get_user_status, :set_action_icon, :get_data_counters, :set_locale
  
  before_filter :get_user_status

  def set_locale
    unless params[:locale].blank?
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  def set_action_icon
    if action_name == "show"
      @action_icon = "eye-open"
    elsif action_name == "new" or action_name == "crete"
      @action_icon = "plus"
    elsif action_name == "edit" or action_name == "update"
      @action_icon = "pencil"
    else
      @action_icon = "cog"
    end
  end
  
  def get_data_counters
    if signed_in?
      companies
      branches
      roles
      users
      comments
    end
  end
  
  def get_user_status
    if signed_in?
      unless current_user.active
        sign_out(current_user)
        redirect_to root_path, :alert => t("errors.messages.account_inactive")
      end
    end
  end
  
  if Rails.env == "production" or Rails.env == "development" or Rails.env == "local"
    rescue_from Exception do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")
      flash[:error] = t(:something_went_wrong)  + exception.to_s + " (" + line_number + ")"
      if signed_in?  
        ErrorReport.create(:user_id => current_user.id, :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => current_user.branch_id, :company_id => current_user.company_id, :environment => Rails.env, :error_time => Time.now, :line_number => line_number, :backtrace => exception.backtrace.to_s)
      else
        ErrorReport.create(:user_id => 4, :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => 1, :company_id => 1, :environment => Rails.env, :error_time => Time.now, :line_number => line_number, :backtrace => exception.backtrace.to_s)
      end
      render welcome_index_path
    end
    rescue_from ActiveRecord::RecordNotFound do |exception|#WORKS
      line_number = exception.backtrace.to_s.split(":in").first.gsub("[\"", "")      
      flash[:error] = t(:something_went_wrong)  + exception.to_s + " (" + line_number + ")"
      if signed_in?  
        ErrorReport.create(:user_id => current_user.id, :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => current_user.branch_id, :company_id => current_user.company_id, :environment => Rails.env, :error_time => Time.now, :line_number => line_number, :backtrace => exception.backtrace.to_s)
      else
        ErrorReport.create(:user_id => 4, :controller_name => controller_name, :action_name => action_name, :description => exception.to_s, :referrer_url => request.referer, :original_path => request.env['ORIGINAL_FULLPATH'], :branch_id => 1, :company_id => 1, :environment => Rails.env, :error_time => Time.now, :line_number => line_number, :backtrace => exception.backtrace.to_s)
      end
      render welcome_index_path
    end 
  end
  
end
