class MeasurementUnitsController < ApplicationController
  before_action :set_measurement_unit, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /measurement_units
  def index
  end

  # GET /measurement_units/1
  def show
  end

  # GET /measurement_units/new
  def new
    @measurement_unit = MeasurementUnit.new
  end

  # GET /measurement_units/1/edit
  def edit
  end

  # POST /measurement_units
  def create
    @measurement_unit = MeasurementUnit.new(measurement_unit_params)
if @measurement_unit.save
      redirect_to @measurement_unit, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /measurement_units/1
def update
if @measurement_unit.update(measurement_unit_params)
      redirect_to @measurement_unit, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /measurement_units/1
def destroy
@measurement_unit.destroy
    redirect_to measurement_units_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
measurement_units
end

def set_icon
    @icon = "exclamation-sign"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_measurement_unit
      @measurement_unit = MeasurementUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_unit_params
      params.require(:measurement_unit).permit(:name, :description, :company_id, :branch_id)
  end
end
