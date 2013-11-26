class MobileServicesController < ApplicationController
  def index
  end
  def get_driver_info
    @driver = Driver.find_by_user_id(params[:user_id])
    current_date = (I18n.l Time.now, :format => :long_no_time)
    render json: @driver.blank? ?  {'status' => t('messages.info.driver_not_found')} : [@driver, @driver.user, @driver.truck, @driver.company, @driver.branch, current_date]
  end
end
