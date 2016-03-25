class BuildingSheetsController < ApplicationController
  layout "logged_in_layout"

  def index
    # @user_id = current_user.id
    # @project = Project.find_by(id: params[:project_id])
    # @building_sheet = BuildingSheet.new
    # @building_sheet.build_context
  end

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
    redirect_to :back   
  end

  def edit
    
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
