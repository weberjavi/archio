class BuildingSheetsController < ApplicationController
  layout "logged_in_layout"

 

  def new
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @building_sheet = BuildingSheet.new
    @building_sheet.build_context
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @building_sheet = BuildingSheet.new(permitted_params)
    if @building_sheet.save
      flash[:notice] = "Created"
    else
      flash.now[:error] = "Error"
    end  
    redirect_to project_records_path 
  end

  def edit
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @building_sheet = BuildingSheet.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:project_id])
    @building_sheet = BuildingSheet.find_by(id: params[:id])
    if @building_sheet.update(permitted_params)
      flash[:notice] = "updated"
      redirect_to project_records_path
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    @building_sheet = BuildingSheet.find_by(id: params[:id])
    if @building_sheet.destroy
      flash[:notice] = "Record deleted"
      redirect_to project_records_path 
    end
  end



  private

  def permitted_params
    params.require(:building_sheet).permit( :description,
                                            :substructure,
                                            context_attributes:[  :interpretation,
                                                                  :ue,
                                                                  :discussion,
                                                                  :site_code,
                                                                  :area,
                                                                  :date,
                                                                  :recorded_by,
                                                                  :below,
                                                                  :above,
                                                                  :section,
                                                                  :trench,
                                                                  :id,
                                                                  :project_id
                                                                ])
  end
end
