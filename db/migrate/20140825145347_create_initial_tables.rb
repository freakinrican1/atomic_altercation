class CreateInitialTables < ActiveRecord::Migration
  def change
    
    create_table :elements do |t|
          t.string :name
          t.integer :weight
          t.string :comic
        end
    
        create_table :moves do |t|
          t.integer :player_id
          t.integer :element_id
        end
    
        create_table :players do |t|
          t.string :name
        end
    
      end
    end

# CREATE TABLE elements (id INTEGER PRIMARY KEY, name VARCHAR(100), weight INT, comic VARCHAR);
# CREATE TABLE moves (id INTEGER PRIMARY KEY, player_id INTEGER, element_id INTEGER);
# CREATE TABLE players (id INTEGER PRIMARY KEY, name VARCHAR(100));