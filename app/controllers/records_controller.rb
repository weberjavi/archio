class RecordsController < ApplicationController

  def new
    
  end

  def create
    @context = Context.new(context_params)
    if @context.save
      flash[:notice] = "Context created correctly"
      specific_record = SkeletonSheet.new(skeleton_params)
      if @context.context_types.create(contextable: specific_record)
        flash[:notice] = "MAZURCA PARA DOS MUERTOS"
      end
    end
  end

  def edit
    
  end

  def update
    
  end

  def index
    
  end

  private

  def record_params
    if @type_of_record == :context_sheets
      params.require(:context_sheet).permit(:context_type, :description, :project_id)
    elsif @type_of_record == :building_sheets
      params.require(:building_sheet).permit(:substructure, :description, :project_id)
    elsif @type_of_record == :masonry_sheets
      params.require(:masonry_sheet).permit(:description, :project_id)
    elsif @type_of_record == :skeleton_sheets
      params.require(:skeleton_sheet).permit(:description, :project_id, :grave_type, :grave_cut, :grave_fill, :coffin, :orientation, :group, :burial_number, :provisional_period, :skeleton_description)
    elsif @type_of_record == :timber_sheets
      params.require(:timber_sheet).permit(:species, :description, :project_id, :dendro_sample, :knotty, :bark, :sapwood)
    end
  end

  def skeleton_params
    params.require(:skeleton_sheet).permit(:description, :project_id, :grave_type, :grave_cut, :grave_fill, :coffin, :orientation, :group, :burial_number, :provisional_period, :skeleton_description)
  end

  def context_params
    params.require(:context).permit(:interpretation, :discussion, :site_code, :area, :date, :recorded_by, :below, :above, :section, :trench, :contextable_id, :contextable_type)
  end

end
