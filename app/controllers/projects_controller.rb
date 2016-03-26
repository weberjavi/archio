class ProjectsController < ApplicationController
  layout "logged_in_layout"

  before_action :authenticate_user!
  before_action :authenticate_admin, only:[:destroy, :edit]

  def new
    @user = User.find_by(id: params[:user_id])
    @project = Project.new
    @projects = current_user.projects
  end

  def show
    @users = User.all
    @project = Project.find_by(id: params[:id])
    @project_members = @project.users
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)
    binding.pry
    if @project.save!
      flash[:notice] = "Project created correctly"
      @project.users << @user
      @user.add_role :admin, @project
      redirect_to user_project_path(@user.id, @project.id)
    else
      flash[:alert] = "You have some errors:"
      redirect_to new_user_project_path(@user.id)
    end  
    
  end

  def index 
    @projects = current_user.projects.all
    @project = current_user.projects.new
  end

 def add_user_to_project
    @project = Project.find_by(id: params[:id])
    new_user = User.find_by(email: params[:new_user])
    if @project.users.include? new_user
      flash[:notice] = "#{new_user.name} is already part of the team"
    elsif new_user
      @project.users << new_user
      flash[:notice] = "#{new_user.name} added to the team"
    else
      flash[:notice] = "This User does not exists in the database"
    end
    redirect_to :back
  end

  def geoJson_projects
    @geoJson = []
    @projects = Project.all
    @projects.each do |project|
      lat = project.lat
      if lat.is_a? String
        @geoJson << {
          type: 'Feature',
          geometry:{
            type: 'Point',
            coordinates:[project.lat.to_f, project.lng.to_f]
          },
          properties:{
            name: project.name,
            description: project.description
          }
        }
      else
        @geoJson
      end
    end
    render json: @geoJson
  end


  private

  def project_params
    params.require(:project).permit(:name, :description, :resource_id, :user_id, :lat, :lng)
  end
end
