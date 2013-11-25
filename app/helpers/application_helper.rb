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
      else  
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
    else  
      @users = User.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @users_count = @users.count
    end
  end
  
  def comments
    @comments = Comment.order("id DESC").paginate(:page => params[:page])
    @comments_count = @comments.count
  end
  
  def statuses
    @statuses = Status.order('id DESC').paginate(:page => params[:page])
    @statuses_count = @statuses.count
  end
  
  def cellphones
    if current_user.role.super_admin
      @cellphones = Cellphone.order('id DESC').paginate(:page => params[:page])
      @cellphones_count = @cellphones.count
    elsif current_user.role.company_admin
      @cellphones = Cellphone.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @cellphones_count = @cellphones.count
    else  
      @cellphones = Cellphone.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @cellphones_count = @cellphones.count
    end
  end
  
  def trucks
    if current_user.role.super_admin
      @trucks = Truck.order('id DESC').paginate(:page => params[:page])
      @trucks_count = @trucks.count
    elsif current_user.role.company_admin
      @trucks = Truck.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @trucks_count = @trucks.count
    else  
      @trucks = Truck.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @trucks_count = @trucks.count
    end
  end
  
  def messages
    if current_user.role.super_admin
      @messages = Message.order('id DESC').paginate(:page => params[:page])
      @messages_count = @messages.count
    elsif current_user.role.company_admin
      @messages = Message.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @messages_count = @messages.count
    else  
      @messages = Message.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @messages_count = @messages.count
    end
  end
  
  def families
    if current_user.role.super_admin
      @families = Family.order('id DESC').paginate(:page => params[:page])
      @families_count = @families.count
    elsif current_user.role.company_admin
      @families = Family.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @families_count = @families.count
    else  
      @families = Family.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @families_count = @families.count
    end
  end
  
  def subfamilies
    if current_user.role.super_admin
      @subfamilies = Subfamily.order('id DESC').paginate(:page => params[:page])
      @subfamilies_count = @subfamilies.count
    elsif current_user.role.company_admin
      @subfamilies = Subfamily.where(:company_id => current_user.company_id).order('id DESC').paginate(:page => params[:page])
      @subfamilies_count = @subfamilies.count
    else  
      @subfamilies = Subfamily.where(:branch_id => current_user.branch_id).order('id DESC').paginate(:page => params[:page])
      @subfamilies_count = @subfamilies.count
    end
  end
  
  
end
