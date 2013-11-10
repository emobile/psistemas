class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :get_user_role, only: [:edit, :update]
  before_filter :authenticate_user!#, except: [:new, :create]
  before_filter :set_icon
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    @users = User.order("id ASC").paginate(:page => params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  
  def get_user_role
    unless current_user.role.super_admin or current_user.role.company_admin or current_user.role.branch_admin
      flash[:error] = t('activerecord.errors.messages.access_denied')
      redirect_to @user
    end
  end
  
  def set_icon
    @icon = "user"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone1, :phone2, :fax, :address1, :address2, :city, :state, :zip, :country, :role_id, :active, :logo, :logo_crop_x, :logo_crop_y, :logo_crop_w, :avatar_tmp_basename, :company_id, :branch_id)
  end
end
