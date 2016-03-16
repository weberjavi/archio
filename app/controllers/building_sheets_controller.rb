class BuildingSheetsController < ApplicationController
  #   :new, :create, :show, :index

  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @record = BuildingSheet.new(building_sheet_params)
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
  def building_sheet_params
    params.require(:building_sheet).permit(:substructure, :description, :project_id)
  end
  
end
