class ContextsController < ApplicationController
  def show
    @project = Project.find_by(id: params[:project_id])
    @context = Context.find_by(id: params[:id])
  end
end
