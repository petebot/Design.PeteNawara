class CreateTools < ActiveRecord::Migration
  def self.up
    create_table :tools do |table|
      table.string :name
      table.string :url
      table.text :description

      table.timestamps
    end
    
  end

  def self.down
    drop_table :tools
  end
end
