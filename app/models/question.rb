class Question < ActiveRecord::Base
  belongs_to :person, :foreign_key => "author_id"
  has_many :question_comments
end
