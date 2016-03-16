class ContextsController < ApplicationController
  # :new, :create, :edit, :update, :index

  def new
    
  end

  def create
    @actual_record = actual_record
    @common_record = @actual_record.contexts.new(context_params)
    if @common_record.save
      flash[:notice] = "Project created correctly"
      redirect_to  project_path
    else
      flash[:alert] = "You have some errors:"
    end 
  end

  def edit
    
  end

  def update
    
  end

  def index
    
  end

  private
  def context_params
    params.require(:context).permit(:interpretation, :discussion, :site_code, :area, :context, :date, :recorded_by, :below, :above, :section, :trench, :contextable_id, :contextable_type)
  end

  def actual_record
    @actual_project = Project.find_by(id: params[:project_id])
    if params[:context_sheet_id]
      ContextSheet.find_by(id: params[:context_sheet_id])
    elsif params[:skeleton_sheet_id]
      SkeletonSheet.find_by(id: params[:skeleton_sheet_id])
    elsif params[:masonry_sheet_id]
      MasonrySheet.find_by(id: params[:masonry_sheet_id])
    elsif params[:timber_sheet_id]
      TimberSheet.find_by(id: params[:timber_sheet_id])
    elsif params[:building_sheet_id]
      BuildingSheet.find_by(id: params[:building_sheet_id])
    end   
  end
  

end
