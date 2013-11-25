class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /families
  def index
  end

  # GET /families/1
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  def create
    @family = Family.new(family_params)
if @family.save
      redirect_to @family, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /families/1
def update
if @family.update(family_params)
      redirect_to @family, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /families/1
def destroy
@family.destroy
    redirect_to families_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
families
end

def set_icon
    @icon = "exclamation-sign"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_params
      params.require(:family).permit(:name, :description, :company_id, :branch_id, :client_id, :client_branch_id)
  end
end
