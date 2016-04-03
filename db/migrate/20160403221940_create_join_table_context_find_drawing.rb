class CreateJoinTableContextFindDrawing < ActiveRecord::Migration
  def change
  	create_table :contexts_section_drawings, id: false do |t|
      t.belongs_to :context, index: true
      t.belongs_to :section_drawing, index: true
    end
  end
end
