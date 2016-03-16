class ContextSheetsController < ApplicationController

  def new
    
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @record = ContextSheet.new(context_sheet_params)
    if @record.save
      flash[:notice] = "Project created correctly"
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
  def context_sheet_params
    params.require(:context_sheet).permit(:context_type, :description, :project_id)
  end

end
