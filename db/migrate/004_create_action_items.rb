class CreateActionItems < ActiveRecord::Migration
  def self.up
    create_table :action_items do |t|
      t.integer :author_id
      t.boolean :approved
      t.text :body
      t.integer :votes

      t.timestamps
    end
  end

  def self.down
    drop_table :action_items
  end
end
