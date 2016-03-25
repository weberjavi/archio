class ContextsController < ApplicationController
  def show
    @project = Project.find_by(id: params[:project_id])
    @context = Context.find_by(id: params[:id])
    context_attr = @context.attributes
    contextable = @context.contextable
    contextable_attr = contextable.attributes
    @data = context_attr.merge(contextable: contextable_attr)
    #render json: @data
  end
  def update
    @project = Project.find_by(id: params[:project_id])
    @context = Context.find_by(id: params[:id])
    context_attr = @context.attributes
    contextable = @context.contextable
    contextable_attr = contextable.attributes
    @data = context_attr.merge(contextable: contextable_attr)
    #render json: @data
  end
end
