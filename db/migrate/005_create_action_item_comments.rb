class CreateActionItemComments < ActiveRecord::Migration
  def self.up
    create_table :action_item_comments do |t|
      t.integer :action_item_id
      t.integer :person_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :action_item_comments
  end
end
