class SubfamiliesController < ApplicationController
  before_action :set_subfamily, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /subfamilies
  def index
  end

  # GET /subfamilies/1
  def show
  end

  # GET /subfamilies/new
  def new
    @subfamily = Subfamily.new
  end

  # GET /subfamilies/1/edit
  def edit
  end

  # POST /subfamilies
  def create
    @subfamily = Subfamily.new(subfamily_params)
if @subfamily.save
      redirect_to @subfamily, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /subfamilies/1
def update
if @subfamily.update(subfamily_params)
      redirect_to @subfamily, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /subfamilies/1
def destroy
@subfamily.destroy
    redirect_to subfamilies_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
subfamilies
end

def set_icon
    @icon = "exclamation-sign"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_subfamily
      @subfamily = Subfamily.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subfamily_params
      params.require(:subfamily).permit(:name, :description, :family_id, :company_id)
  end
end
