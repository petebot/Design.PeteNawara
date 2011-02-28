class ProjectsTool < ActiveRecord::Base
  belongs_to :project
  belongs_to :tool
end