class MasonrySheetsController < ApplicationController
  layout "logged_in_layout"

  def new
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @masonry_sheet = MasonrySheet.new
    @masonry_sheet.build_context
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @masonry_sheet = MasonrySheet.new(permitted_params)
    if @masonry_sheet.save
      flash[:notice] = "Created"
    else
      flash.now[:error] = "Error"
    end  
    redirect_to project_records_path
  end

  def edit
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @masonry_sheet = MasonrySheet.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:project_id])
    @masonry_sheet = MasonrySheet.find_by(id: params[:id])
    if @masonry_sheet.update(permitted_params)
      flash[:notice] = "updated"
      redirect_to project_records_path
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    @masonry_sheet = MasonrySheet.find_by(id: params[:id])
    if @masonry_sheet.destroy
      flash[:notice] = "Record deleted"
      redirect_to project_records_path 
    end
  end



  private

  def permitted_params
    params.require(:masonry_sheet).permit( :description,
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
