class CreateProjectsTools < ActiveRecord::Migration
  def self.up
    create_table :projects_tools do |table|
      table.integer :project_id
      table.integer :tool_id

      table.timestamps
    end
    add_index :projects_tools, [:project_id, :tool_id], :unique => true
  end

  def self.down
  end
end
