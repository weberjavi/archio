class TimberSheetsController < ApplicationController
  layout "logged_in_layout"

  def index
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheet.new
    @timber_sheet.build_context
  end

  def new
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheet.new
    @timber_sheet.build_context
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheet.new(permitted_params)
    if @timber_sheet.save
      flash[:notice] = "Created"
    else
      flash.now[:error] = "Error"
    end  
    redirect_to :back   
  end

  def edit
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheets.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheets.find_by(id: params[:id])
    if @timber_sheet.update(permitted_params)
      flash[:notice] = "updated"
      redirect_to project_records_path
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    @timber_sheet = TimberSheets.find_by(id: params[:id])
    if @timber_sheet.destroy
      #flash[:notice] = "Record deleted"
      redirect_to project_records_path 
    end
  end



  private

  def permitted_params
    params.require(:timber_sheet).permit( :description,
                                            :species,
                                            :grave_fill,
                                            :dendro_sample,
                                            :knotty,
                                            :bark,
                                            :sapwood,
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
