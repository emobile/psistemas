class CellphonesController < ApplicationController
  before_action :set_cellphone, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /cellphones
  def index
  end

  # GET /cellphones/1
  def show
  end

  # GET /cellphones/new
  def new
    @cellphone = Cellphone.new
  end

  # GET /cellphones/1/edit
  def edit
  end

  # POST /cellphones
  def create
    @cellphone = Cellphone.new(cellphone_params)
    if @cellphone.save
      redirect_to @cellphone, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /cellphones/1
  def update
    if @cellphone.update(cellphone_params)
      redirect_to @cellphone, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /cellphones/1
  def destroy
    @cellphone.destroy
    redirect_to cellphones_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def get_data
    cellphones
  end

  def set_icon
    @icon = "phone"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cellphone
    @cellphone = Cellphone.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cellphone_params
    params.require(:cellphone).permit(:phone_number, :model, :brand, :color, :ope_system, :condition, :imei, :description, :user_id, :branch_id, :company_id)
  end
end
