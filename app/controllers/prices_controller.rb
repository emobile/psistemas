class PricesController < ApplicationController
  before_action :set_price, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /prices
  def index
  end

  # GET /prices/1
  def show
  end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit
  end

  # POST /prices
  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to @price, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /prices/1
  def update
    if @price.update(price_params)
      redirect_to @price, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
    else
      render action: 'edit'
    end
  end

  # DELETE /prices/1
  def destroy
    @price.destroy
    redirect_to prices_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
  end
  
  def get_data
    prices
  end

  def set_icon
    @icon = "exclamation-sign"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = Price.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def price_params
    params.require(:price).permit(:price, :description, :company_id, :branch_id, :product_id, :client_type_id, :measurement_unit_id)
  end
end
