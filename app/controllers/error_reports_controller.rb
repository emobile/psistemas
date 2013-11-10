class ErrorReportsController < ApplicationController
  before_action :set_error_report, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon
  load_and_authorize_resource except: [:create]
  
  # GET /error_reports
  def index
    @error_reports = ErrorReport.order("id ASC")
  end

  # GET /error_reports/1
  def show
  end

  # GET /error_reports/new
  def new
    @error_report = ErrorReport.new
  end

  # GET /error_reports/1/edit
  def edit
  end

  # POST /error_reports
  def create
    @error_report = ErrorReport.new(error_report_params)
    if @error_report.save
      redirect_to @error_report, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /error_reports/1
  def update
    if @error_report.update(error_report_params)
      redirect_to @error_report, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /error_reports/1
  def destroy
    @error_report.destroy
    redirect_to error_reports_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def set_icon
    @icon = "warning-sign"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error_report
      @error_report = ErrorReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def error_report_params
      params.require(:error_report).permit(:user_id, :controller_name, :action_name, :line_number, :referrer_url, :original_path, :environment, :branch_id, :company_id, :description, :backtrace, :error_time)
    end
end
