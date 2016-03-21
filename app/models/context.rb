class Context < ActiveRecord::Base
  belongs_to :project
  # has_many :context_types
  # has_many :building_sheets, through: :context_types, source: :contextable, source_type: "BuildingSheet"
  # has_many :context_sheets, through: :context_types, source: :contextable, source_type: "ContextSheet"
  # has_many :masonry_sheets, through: :context_types, source: :contextable, source_type: "MasonrySheet"
  # has_many :skeleton_sheets, through: :context_types, source: :contextable, source_type: "SkeletonSheet"
  # has_many :timber_sheets, through: :context_types, source: :contextable, source_type: "TimberSheet"
  belongs_to :contextable, polymorphic: true
end
