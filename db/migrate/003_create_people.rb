class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.decimal :latitude, :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10
      t.text :bioblurb
      
      t.database_authenticatable
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
