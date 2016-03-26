class SkeletonSheetsController < ApplicationController
  layout "logged_in_layout"

  
  def index
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.new
    @skeleton_sheet.build_context
  end

  def new
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.new
    @skeleton_sheet.build_context
  end

  def create
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.new(permitted_params)
    if @skeleton_sheet.save
      flash[:notice] = "Created"
    else
      flash.now[:error] = "Error"
    end  
    redirect_to project_records_path 
  end

  def edit
    @user_id = current_user.id
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.find_by(id: params[:id])
    if @skeleton_sheet.update(permitted_params)
      flash[:notice] = "updated"
      redirect_to project_records_path
    end
  end

  def destroy
    @project = Project.find_by(id: params[:project_id])
    @skeleton_sheet = SkeletonSheet.find_by(id: params[:id])
    if @skeleton_sheet.destroy
      #flash[:notice] = "Record deleted"
      redirect_to project_records_path 
    end
  end



  private

  def permitted_params
    params.require(:skeleton_sheet).permit( :grave_type,
                                            :grave_cut,
                                            :grave_fill,
                                            :coffin,
                                            :orientation,
                                            :group,
                                            :burial_number,
                                            :provisional_period,
                                            :skeleton_description,
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
