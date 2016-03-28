class ProjectsController < ApplicationController
  layout "logged_in_layout"

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only:[:geoJson_projects]
  #before_action :authenticate_admin, only:[:destroy, :edit]

  def index 
    @projects = current_user.projects.all
    @project = current_user.projects.new
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @project = Project.new
    @projects = current_user.projects
  end

  def show
    @user = current_user
    @users = User.all
    @project = Project.find_by(id: params[:id])
    @project_members = @project.users
  end

  def create
    @user = current_user
    @project = @user.projects.new(project_params)
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

  def edit
    @user = current_user
    @project = Project.find_by(id: params[:id])
  end

  def update
    @user = current_user
    @project = Project.find_by(id: params[:id])
    if @user.has_role? :admin, @project
      @project.update(project_params)
      flash[:notice] = "Project updated succesfully"
      redirect_to user_project_path(@user.id, @project.id)
    else
      flash[:notice] = "You do not have the required permissions to edit this project"
      redirect_to user_project_path(@user.id, @project.id)
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @project = Project.find_by(id: params[:id])
    if @user.has_role? :admin, @project
      @project.destroy
      flash[:notice] = "Project deleted"
    end
    redirect_to user_projects_path(@user.id)
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
            coordinates:[project.lng.to_f, project.lat.to_f]
          },
          properties:{
            name: project.name,
            description: project.description,
            id: project.id
          }
        }
      else
        @geoJson
      end
    end
    render json: @geoJson
  end

  def geoJson_individual_project
    @geoJson_project = []
    @project = Project.find_by(id: params[:id])
    @geoJson_project << {
      type: 'Feature',
      geometry:{
      type: 'Point',
      coordinates:[@project.lng.to_f, @project.lat.to_f]
    },
    properties:{
      name: @project.name,
      description: @project.description,
      id: @project.id
     }
    }
    render json: @geoJson_project
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :resource_id, :user_id, :lat, :lng)
  end

end








