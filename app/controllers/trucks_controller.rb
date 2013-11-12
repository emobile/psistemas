class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /trucks
  def index
  end

  # GET /trucks/1
  def show
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit
  end

  # POST /trucks
  def create
    @truck = Truck.new(truck_params)
if @truck.save
      redirect_to @truck, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /trucks/1
def update
if @truck.update(truck_params)
      redirect_to @truck, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /trucks/1
def destroy
@truck.destroy
    redirect_to trucks_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
trucks
end

def set_icon
    @icon = "truck"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_truck
      @truck = Truck.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def truck_params
      params.require(:truck).permit(:model, :brand, :year, :truck_type, :plate_no, :serial_no, :color, :wheels_no, :other, :identifier, :branch_id, :company_id)
  end
end
