class SkeletonSheetsController < ApplicationController
  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @record = SkeletonSheet.new(skeleton_sheet_params)
    if @record.save
      flash[:notice] = "Record created correctly"
      redirect_to  project_path
    else
      flash[:alert] = "You have some errors:"
    end  
  end

  def show
    
  end

  def index
    
  end

  private
  def skeleton_sheet_params
    params.require(:skeleton_sheet).permit(:description, :project_id, :grave_type, :grave_cut, :grave_fill, :coffin, :orientation, :group, :burial_number, :provisional_period, :skeleton_description)
  end
  
end
