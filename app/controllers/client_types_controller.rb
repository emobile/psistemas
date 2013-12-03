class ClientTypesController < ApplicationController
  before_action :set_client_type, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon  
  #before_filter :get_data, :except => [:show, :destroy]
  load_and_authorize_resource except: [:create]
  # GET /client_types
  def index
  end

  # GET /client_types/1
  def show
  end

  # GET /client_types/new
  def new
    @client_type = ClientType.new
  end

  # GET /client_types/1/edit
  def edit
  end

  # POST /client_types
  def create
    @client_type = ClientType.new(client_type_params)
if @client_type.save
      redirect_to @client_type, notice:  t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'new'
end
end

# PATCH/PUT /client_types/1
def update
if @client_type.update(client_type_params)
      redirect_to @client_type, notice:  t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
else
  render action: 'edit'
end
end

# DELETE /client_types/1
def destroy
@client_type.destroy
    redirect_to client_types_url, notice:  t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize}").downcase)
end
  
def get_data
client_types
end

def set_icon
    @icon = "exclamation-sign"
end
  
private
# Use callbacks to share common setup or constraints between actions.
def set_client_type
      @client_type = ClientType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_type_params
      params.require(:client_type).permit(:name, :description, :company_id, :branch_id)
  end
end
