class AjaxCallsController < ApplicationController
  layout false
  respond_to :json
  
  def get_branches
    @branches = @branches.where(:company_id => params[:company_id])
    render json: @branches, :callback => params[:callback]
  end
  
end
