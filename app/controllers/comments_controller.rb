class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_icon
  load_and_authorize_resource except: [:create]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.order("id DESC").paginate(:page => params[:page])
    @comments_count = @comments.count
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        ["webmaster@emobile.com.mx", "jtorres@emobile.com.mx", "dchacon@emobile.com.mx"].each do |email|
          SupportMailer.new_comment(@comment, email).deliver!
        end
        format.html { redirect_to @comment, notice: t("actions.created.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase) }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: t("actions.updated.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase)  }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: t("actions.destroyed.male",  model: t("activerecord.models.#{controller_name.singularize.gsub(" ", "")}").downcase)  }
      format.json { head :no_content }
    end
  end
  
  def set_icon
    @icon = "comments"
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_id, :email, :comment, :app_name, :branch_id, :company_id)
  end
end
