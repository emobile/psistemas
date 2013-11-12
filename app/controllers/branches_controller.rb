class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  
  # GET /branches
  def index

  end

  # GET /branches/1
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      redirect_to @branch, notice:  t("actions.created.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /branches/1
  def update
    if @branch.update(branch_params)
      #@company = Company.find_by_id(@branch.company_id)
      #company_params = branch_params.delete :main_branch 
      #@company.update(company_params)
      redirect_to @branch, notice:  t("actions.updated.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /branches/1
  def destroy
    @branch.destroy
    redirect_to branches_url, notice:  t("actions.destroyed.female",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end

  def get_data
    branches
    companies
  end
  
  def set_icon
    @icon = "sitemap"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    @branch = Branch.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def branch_params
    params.require(:branch).permit(:name, :contact_name, :main_branch, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id)
  end
end
