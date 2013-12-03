class ClientBranchesController < ApplicationController
  before_action :set_client_branch, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /client_branches
  def index
  end

  # GET /client_branches/1
  def show
  end

  # GET /client_branches/new
  def new
    @client_branch = ClientBranch.new
  end

  # GET /client_branches/1/edit
  def edit
  end

  # POST /client_branches
  def create
    @client_branch = ClientBranch.new(client_branch_params)
    if @client_branch.save
      redirect_to @client_branch, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /client_branches/1
  def update
    if @client_branch.update(client_branch_params)
      redirect_to @client_branch, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /client_branches/1
  def destroy
    @client_branch.destroy
    redirect_to client_branches_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def get_data
    client_branches
  end

  def set_icon
    @icon = "exclamation-sign"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_client_branch
    @client_branch = ClientBranch.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_branch_params
    params.require(:client_branch).permit(:name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :client_id, :client_type_id, :company_id, :branch_id, :latitude, :longitude)
  end
end
