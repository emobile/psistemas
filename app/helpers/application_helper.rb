module ApplicationHelper 
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end
  
  def resource_class
    devise_mapping.to
  end
  
  def devise_mapping
    Devise.mappings[:user]
  end
  
  def companies
    if current_user.role.super_admin
      @companies = Company.order('id DESC').paginate(:page => params[:page])
      @companies_count = @companies.count
    else  
      @companies = Company.where(:id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @companies_count = @companies.count
    end
  end
  
  def branches
    if current_user.role.super_admin
      @branches = Branch.order('id DESC').paginate(:page => params[:page])
      @branches_count = @branches.count
    elsif current_user.role.company_admin
      @branches = Branch.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @branches_count = @branches.count
    else
      @branches = Branch.where(:id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @branches_count = Branch.where(:company_id => current_user.company_id).count
    end
  end
  
  def roles
    @roles_count = Role.count
    if controller_name == "roles" and action_name == "index" 
      if current_user.role.super_admin
        @roles = Role.order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.company_admin
        @roles = Role.where(:super_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.branch_admin or current_user.role.routes_admin
        @roles = Role.where(:super_admin => false, :company_admin => false).order('id DESC').paginate(:page => params[:page])
      end
    else 
      if current_user.role.super_admin
        @roles = Role.where(:super_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.company_admin
        @roles = Role.where(:super_admin => false, :company_admin => false).order('id DESC').paginate(:page => params[:page])
      elsif current_user.role.branch_admin or current_user.role.routes_admin
        @roles = Role.where(:super_admin => false, :company_admin => false, :branch_admin => false).order('id DESC').paginate(:page => params[:page])
      end
    end
  end
  
  def users
    if current_user.role.super_admin
      @users = User.order('id DESC').paginate(:page => params[:page])
      @users_count = @users.count
    elsif current_user.role.company_admin
      @users = User.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @users_count = @users.count
    elsif current_user.role.branch_admin or current_user.role.routes_admin
      @users = User.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @users_count = @users.count
    end
  end
  
end
