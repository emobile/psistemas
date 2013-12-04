class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /stocks
  def index
  end

  # GET /stocks/1
  def show
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  def create
    @stock = Stock.new(stock_params)
if @stock.save
      redirect_to @stock, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /stocks/1
def update
if @stock.update(stock_params)
      redirect_to @stock, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /stocks/1
def destroy
@stock.destroy
    redirect_to stocks_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
stocks
end

def set_icon
    @icon = "exclamation-sign"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_stock
      @stock = Stock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stock_params
      params.require(:stock).permit(:company_id, :branch_id, :storage_id, :product_id, :quantity, :measurement_unit_id)
  end
end
