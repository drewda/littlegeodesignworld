class CreateQuestionComments < ActiveRecord::Migration
  def self.up
    create_table :question_comments do |t|
      t.integer :question_id
      t.integer :person_id
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :question_comments
  end
end
