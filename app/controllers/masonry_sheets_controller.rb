class MasonrySheetsController < ApplicationController
  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @record = MasonrySheet.new(masonry_sheet_params)
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
  def masonry_sheet_params
    params.require(:masonry_sheet).permit(:description, :project_id)
  end
  
end
