class MobileServicesController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :detect_platform
  respond_to :json
  layout false
  def index
  end
  def get_driver_info
    @driver = Driver.find_by_user_id(params[:user_id])
    current_date = (I18n.l Time.now, :format => :long_no_time)
    render json: @driver.blank? ?  {'status' => t('messages.info.driver_not_found')} : [@driver, @driver.user, @driver.truck, @driver.company, @driver.branch, current_date]
  end
  
  def detect_platform
    #    if request.env['HTTP_USER_AGENT'] == ""
    #      access = true
    #    else
    #      access = false
    #    end
    #    unless access
    #      flash[:alert] = t('no_access')
    #      redirect_to root_path
    #    end
  end
  
end
