class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  load_and_authorize_resource except: [:create]
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.order("id ASC").paginate(:page => params[:page])
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
        format.json { render action: 'show', status: :created, location: @role }
      else
        format.html { render action: 'new' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
    if @role.protected and action_name != "show"
      flash[:error] = t('activerecord.errors.messages.access_denied')
      redirect_to roles_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :protected, :super_admin, :clinic_manager, :doctor, :secretary, :patient, :description)
  end
end
