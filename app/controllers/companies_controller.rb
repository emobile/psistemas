class CompaniesController < ApplicationController
  include CompaniesHelper
  include BranchesHelper
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon
  load_and_authorize_resource except: [:create]
  
  # GET /companies
  def index
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    if @company.save
      create_company_dependencies
      create_branch_dependencies
      redirect_to @company, notice:  t("actions.created.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      update_company_dependencies
      redirect_to @company, notice:  t("actions.updated.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice:  t("actions.destroyed.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def set_icon
    @icon = "globe"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def company_params
    params.require(:company).permit(:name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description)
  end
end
