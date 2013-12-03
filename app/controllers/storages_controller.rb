class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /storages
  def index
  end

  # GET /storages/1
  def show
  end

  # GET /storages/new
  def new
    @storage = Storage.new
  end

  # GET /storages/1/edit
  def edit
  end

  # POST /storages
  def create
    @storage = Storage.new(storage_params)
    if @storage.save
      redirect_to @storage, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /storages/1
  def update
    if @storage.update(storage_params)
      redirect_to @storage, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /storages/1
  def destroy
    @storage.destroy
    redirect_to storages_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def get_data
    storages
  end

  def set_icon
    @icon = "exclamation-sign"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_storage
    @storage = Storage.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def storage_params
    params.require(:storage).permit(:name, :contact, :email1, :email2, :webpage, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :description, :company_id, :branch_id, :main_storage)
  end
end
