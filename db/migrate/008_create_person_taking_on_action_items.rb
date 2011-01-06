class CreatePersonTakingOnActionItems < ActiveRecord::Migration
  def self.up
    create_table :person_taking_on_action_items do |t|
      t.integer :person_id
      t.integer :action_item_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :person_taking_on_action_items
  end
end
