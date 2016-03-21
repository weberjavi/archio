class BuildingSheetsController < ApplicationController
  def create
    @project = Project.find_by(id: params[:project_id])
    @context = @project.contexts.create(context_params)
    if @context.save
      @specific_record = BuildingSheet.create(building_params)
      if @context.context_types.create(contextable: @specific_record)
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

  def building_params
    params.require(:building_sheet).permit( :description, :substructure)
  end

  def context_params
    params.require(:context).permit( :interpretation, :discussion, :site_code, :area, :date, :recorded_by, :below, :above, :section, :trench, :contextable_id, :contextable_type)

  end
end
