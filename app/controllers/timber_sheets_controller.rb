class TimberSheetsController < ApplicationController

  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @record = TimberSheet.new(timber_sheet_params)
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
  def timber_sheet_params
    params.require(:timber_sheet).permit(:species, :description, :project_id, :dendro_sample, :knotty, :bark, :sapwood)
  end
  
end
