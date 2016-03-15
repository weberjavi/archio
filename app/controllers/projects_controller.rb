class ProjectsController < ApplicationController
  before_action :authenticate_user!


  
  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
