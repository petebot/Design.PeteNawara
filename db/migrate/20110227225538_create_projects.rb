class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |table|
      table.integer :client_id
      table.string  :title
      table.text    :description
      table.date    :start_date
      table.date    :end_date
      table.integer :priority, :limit => 1
      table.string  :url
    end
    add_index :projects, :client_id, :unique => false
  end

  def self.down
    drop_table :projects
  end
end