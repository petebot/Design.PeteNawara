class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
    add_index :clients, :name, :unique => true
    add_index :clients, :url, :unique => true
  end

  def self.down
    drop_table :clients
  end
end
