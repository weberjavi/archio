class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]
  before_action :user_belongs_to_project

  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @context = @project.contexts.create(context_params)
    if @context.save
      @skeleton_sheet = SkeletonSheet.create(skeleton_params)
      if @context.context_types.create(contextable: @skeleton_sheet)
        flash[:notice] = "MAZURCA PARA DOS MUERTOS"
        redirect_to :back
      end
    end
  end

  def edit
    
  end

  def update
    
  end

  def index
    @user_id = params[:user_id]
    @project = Project.find_by(id: params[:project_id])
    @context = @project.contexts.new    
  end

  private

  def skeleton_params
    params.require(:skeleton_sheet).permit( :grave_type, :grave_cut, :grave_fill, :coffin, :orientation, :group, :burial_number, :provisional_period, :skeleton_description)
  end

  def context_params
    params.require(:context).permit( :interpretation, :discussion, :site_code, :area, :date, :recorded_by, :below, :above, :section, :trench, :contextable_id, :contextable_type)
  end

  def user_belongs_to_project
    @project = Project.find_by(id: params[:project_id])
    @user = current_user
    unless @user.projects.include? @project
      flash[:notice] = "No tiene los permisos necesarios para acceder a este proyecto"
      redirect_to :root
    end
  end

end
